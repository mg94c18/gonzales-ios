//
//  EpisodeDownloader.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 8/8/22.
//  Copyright © 2022 Stevanovic, Sasa. All rights reserved.
//

import Foundation
import UIKit

protocol EpisodeDownloaderDelegate {
    func progress(forEpisode: Int, changedTo: Int)
    func downloadComplete(forEpisode: Int)
    func downloadFailed(forEpisode: Int)
}

extension EpisodeDownloader: ImageDownloaderDelegate {
    func imageDownloadFailed(sender: ImageDownloader, error: Error) {
        handleError(forEpisode: sender.id)
    }
    
    func httpConnectionFailed(sender: ImageDownloader, statusCode: Int?) {
        handleError(forEpisode: sender.id)
    }

    func invalidImageData(sender: ImageDownloader) {
        handleError(forEpisode: sender.id)
    }
    
    func cantSaveFile(sender: ImageDownloader) {
        handleError(forEpisode: sender.id)
    }
    
    func dataSuccess(sender: ImageDownloader, id: Int) {
    }
    
    func storageSuccess(sender: ImageDownloader) {
        DispatchQueue.main.async {
            self.lastActivity = Date().timeIntervalSince1970
            self.tasks[sender.id]?.removeValue(forKey: sender.url)
            guard let tasks = self.tasks[sender.id],
                let totalPages = self.totalPages[sender.id] else {
                // Can happen if we canceled at the time of storage success (more likely to happen with lots of concurrent downloads)
                self.dispatchNextTask()
                return
            }
            if tasks.isEmpty {
                self.tasks.removeValue(forKey: sender.id)
                self.totalPages.removeValue(forKey: sender.id)
                self.delegate?.downloadComplete(forEpisode: sender.id)
            } else {
                let completed = totalPages - tasks.count
                self.delegate?.progress(forEpisode: sender.id, changedTo: completed * 100 / totalPages)
            }
            self.dispatchNextTask()
        }
    }
}

class EpisodeDownloader {
    var tasks: [Int:[String:URLSessionTask]] = [:]
    var notStartedTasks = Set<URLSessionTask>()
    var totalPages: [Int:Int] = [:]
    var delegate: EpisodeDownloaderDelegate?

    func handleError(forEpisode e: Int) {
        DispatchQueue.main.async {
            self.cancelDownload(forEpisode: e)
        }
        self.dispatchNextTask()
    }
    
    func dispatchNextTask() {
        //DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int.random(in: 0..<15))) {
        DispatchQueue.main.async {
            if !self.notStartedTasks.isEmpty {
                self.notStartedTasks.removeFirst().resume()
            }
        }
    }
    
    func downloadCount() -> Int {
        return tasks.count
    }
    
    static let cacheDir: URL? = {
        let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        if dir != nil && !FileManager.default.fileExists(atPath: dir!.path) {
            try? FileManager.default.createDirectory(at: dir!, withIntermediateDirectories: true)
        }
        return dir
    }()
    
    static func getOrCreateDownloadDir(episode: Int) -> URL? {
        return EpisodeDownloader.cacheDir
    }

    let idleTimerCheck: Int = 30
    var lastActivity: TimeInterval = 0
    func resetIdleTimerIfNoActivity() {
        if Date().timeIntervalSince1970 - lastActivity > TimeInterval(idleTimerCheck) {
            UIApplication.shared.isIdleTimerDisabled = false
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(idleTimerCheck)) {
                self.resetIdleTimerIfNoActivity()
            }
        }
    }

    func startDownloading(episode: Int) -> Bool {
        if !UIApplication.shared.isIdleTimerDisabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(idleTimerCheck)) {
                self.resetIdleTimerIfNoActivity()
            }
        }
        UIApplication.shared.isIdleTimerDisabled = true
        let pages = Assets.pages(forEpisode: episode)
        guard let cacheDir = EpisodeDownloader.getOrCreateDownloadDir(episode: episode) else {
            return false
        }
        cancelDownload(forEpisode: episode)
        tasks[episode] = [:]
        totalPages[episode] = pages.count
        var tasksStarted: Int = 0
        var tasksNotStarted: Int = 0
        for i in 0..<pages.count {
            let fileNameSuffix = OnePageController.lastChunk(from: pages[i], startingWith: "/")
            guard !fileNameSuffix.isEmpty else {
                // TODO: ensure that there are no tasks running for this episode if false is returned
                return false
            }

            let file = cacheDir.path + fileNameSuffix
            if FileManager.default.fileExists(atPath: file) {
                continue
            }
            let url = pages[i]
            let downloader = ImageDownloader(id: episode, url: url, fileName: file, delegate: self, tmpSuffix: ".tmp.dl")
            let task = downloader.createTask()
            tasks[episode]![pages[i]] = task
            if tasksStarted < 4 && notStartedTasks.isEmpty {
                task.resume()
                tasksStarted += 1
            } else {
                notStartedTasks.insert(task)
                tasksNotStarted += 1
            }
        }
        if tasksNotStarted != 0,
            let totalPages = totalPages[episode] {
            DispatchQueue.main.async {
                self.delegate?.progress(forEpisode: episode, changedTo: (totalPages - tasksNotStarted) * 100 / totalPages)
            }
        }
        if tasksStarted == 0 && tasksNotStarted == 0 {
            tasks[episode] = nil
            totalPages[episode] = nil
            DispatchQueue.main.async {
                self.delegate?.downloadComplete(forEpisode: episode)
            }
        }
        return true
    }
    
    func cancelAllDownloads() -> [Int] {
        var canceledEpisodes: [Int] = []
        for e in tasks {
            canceledEpisodes.append(e.key)
            cancelDownload(forEpisode: e.key)
        }
        return canceledEpisodes
    }

    func cancelDownload(forEpisode e: Int) {
        guard let episodeTasks = tasks[e] else {
            return
        }
        for task in episodeTasks {
            notStartedTasks.remove(task.value)
            task.value.cancel()
        }
        tasks[e] = nil
        totalPages[e] = nil
        self.delegate?.progress(forEpisode: e, changedTo: -1)
    }
    
    func progress(forEpisode e: Int) -> Int {
        guard let tasks = tasks[e], let total = totalPages[e] else {
            return -1
        }
        return (total - tasks.count) * 100 / total
    }
    
    static func removeDownload(forEpisode episode: Int) {
        let pages = Assets.pages(forEpisode: episode)
        guard let cacheDir = EpisodeDownloader.getOrCreateDownloadDir(episode: episode) else {
            return
        }
        for i in 0..<pages.count {
            let fileName = OnePageController.lastChunk(from: pages[i], startingWith: "/")
            guard !fileName.isEmpty else {
                return
            }
            try? FileManager.default.removeItem(atPath: cacheDir.path + fileName)
        }
    }
}
