//
//  DetailViewController.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 1/22/19.
//  Copyright © 2019 Stevanovic, Sasa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    func controllerPageReturned(_ ret: OnePageController?) {
        guard let ret = ret else {
            return
        }
        if ret.page.0 != -1 {
            OnePageController.lastLoadedIndex = ret.page.0
        }
    }

    @IBOutlet weak var pageView: UIView!

    var pages: [String] = []
    var episodeId: Int = -1
    var initialPageIndex: Int = 0
    var titleOnly: String = ""
    var progress: Int = -1 {
        didSet {
            if oldValue == -1 && progress != -1 && progress != 100 {
                showCancelDownload()
            }
            if progress == 100 {
                progress = -1
            }
            title = titleOnly + (progress != -1 ? " (\(progress)%)" : "")
            if progress == -1 {
                navigationItem.rightBarButtonItem = nil
            }
        }
    }
    static var lastLoadedEpisode: Int = -1
    static var previouslyLoaded: (Int, Int)?
    var downloadDir: URL?
    var offerDeleteDownloaded: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if episodeId == -1 {
            episodeId = UserDefaults.standard.integer(forKey: "lastEpisodeId")
            initialPageIndex = UserDefaults.standard.integer(forKey: "lastPageIndex")
        }

        pages = Assets.pages(forEpisode: episodeId)
        downloadDir = EpisodeDownloader.getOrCreateDownloadDir(episode: episodeId)
        let firstController = storyboard?.instantiateViewController(withIdentifier: "OnePageController") as! OnePageController
        firstController.downloadDir = downloadDir

        if initialPageIndex >= pages.count {
            initialPageIndex = 0
        }
        firstController.page = (initialPageIndex, pages[initialPageIndex])

        // TODO: treba da ima samo jedan child, tako da ne "add"
        self.addChildViewController(firstController)
        self.pageView.addSubview(firstController.view)
        firstController.view.frame = pageView.bounds
        firstController.didMove(toParentViewController: self)
        
        if DetailViewController.lastLoadedEpisode != -1 && OnePageController.lastLoadedIndex != -1 {
            DetailViewController.previouslyLoaded = (DetailViewController.lastLoadedEpisode, OnePageController.lastLoadedIndex)
        }
        DetailViewController.lastLoadedEpisode = episodeId
        titleOnly = Assets.titles[episodeId]
        progress = AppDelegate.episodeDownloader.progress(forEpisode: episodeId)
        navigationController?.isNavigationBarHidden = false

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        recognizer.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(recognizer)
        
        if DetailViewController.loadStoredArray("visitedEpisodes").count > 4 {
            postInitDownloadButton()
        }
        DetailViewController.updateVisitedEpisodes(byAdding: episodeId)
    }

    func postInitDownloadButton() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.initDownloadButton()
        }
    }
    
    func postInitDownloadButton(at: DispatchTime) {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: at) {
            self.initDownloadButton()
        }
    }

    static func updateVisitedEpisodes(byAdding episodeId: Int) {
        var visitedEpisodes = DetailViewController.loadStoredArray("visitedEpisodes")
        if let index = visitedEpisodes.firstIndex(of: episodeId) {
            visitedEpisodes.remove(at: index)
        }
        visitedEpisodes.append(episodeId)
        UserDefaults.standard.set(visitedEpisodes, forKey: "visitedEpisodes")
    }
    
    static func loadStoredArray(_ key: String) -> [Int] {
        if let stored = UserDefaults.standard.array(forKey: key) as? [Int] {
            return stored
        } else {
            return []
        }
    }
    
    static func downloadedEpisodes() -> [Int] {
        return loadStoredArray("downloadedEpisodes")
    }

    func initDownloadButton() {
        let alreadyDownloaded: Bool
        if let downloadedEpisodes = UserDefaults.standard.array(forKey: "downloadedEpisodes") as? [Int] {
            alreadyDownloaded = downloadedEpisodes.contains(episodeId)
        } else {
            alreadyDownloaded = false
        }
        if alreadyDownloaded {
            DispatchQueue.main.async {
                if self.offerDeleteDownloaded {
                    self.showDeleteDownload()
                } else {
                    self.showAppstore()
                    //self.navigationItem.rightBarButtonItem = nil
                }
            }
        } else {
            if progress == -1 && canDownload() {
                DispatchQueue.main.async {
                    self.showDownload()
                }
            } else if progress != -1 {
                DispatchQueue.main.async {
                    self.showCancelDownload()
                }
            }
        }
    }
    
    func canDownload() -> Bool {
        return startDownload(dryRun: true)
    }
    
    @objc func startDownloading() {
        if startDownload(dryRun: false) {
            navigationItem.rightBarButtonItem = nil
        }
    }

    func startDownload(dryRun: Bool) -> Bool {
        guard let downloadDir = downloadDir else {
            return false
        }
        guard let attrs = try? FileManager.default.attributesOfFileSystem(forPath: downloadDir.path),
           let freeSize = attrs[.systemFreeSize] as? NSNumber else {
            return false
        }
        let buffer = (dryRun ? 350 : 350)
        if freeSize.int64Value / (1<<20) < Assets.averageEpisodeSizeMB + buffer {
            guard var downloadedEpisodes = UserDefaults.standard.array(forKey: "downloadedEpisodes") as? [Int], downloadedEpisodes.count > 0 else {
                return false
            }
            if dryRun {
                return true
            }
            let sacrifice = downloadedEpisodes.removeFirst()
            let confirmation = UIAlertController(title: "Upozorenje", message: "Trenutno image oko \(freeSize.int64Value / (1<<20))MB slobodno, a strip zauzima oko \(Assets.averageEpisodeSizeMB)MB.  Da bi download radio, morate da obrišete staru epizodu '\(Assets.titles[sacrifice])'", preferredStyle: .alert)
            confirmation.addAction(UIAlertAction(title: "Obriši", style: .destructive, handler: { _ in
                EpisodeDownloader.removeDownload(forEpisode: sacrifice)
                UserDefaults.standard.set(downloadedEpisodes, forKey: "downloadedEpisodes")
                if AppDelegate.episodeDownloader.startDownloading(episode: self.episodeId) {
                    self.navigationItem.rightBarButtonItem = nil
                }
            }))
            confirmation.addAction(UIAlertAction(title: "Ne hvala", style: .default))
            self.present(confirmation, animated: true, completion: nil)
            return false
        } else if dryRun {
            return true
        } else {
            return AppDelegate.episodeDownloader.startDownloading(episode: episodeId)
        }
    }

    @objc func cancelDownload() {
        postInitDownloadButton(at: .now() + .seconds(3))
        navigationItem.rightBarButtonItem = nil
        AppDelegate.episodeDownloader.cancelDownload(forEpisode: episodeId)
    }

    @objc func deleteDownload() {
        var downloaded = DetailViewController.downloadedEpisodes()
        guard let index = downloaded.firstIndex(of: episodeId) else {
            // TODO: Log.wtf()
            return
        }
        postInitDownloadButton(at: .now() + .seconds(3))
        navigationItem.rightBarButtonItem = nil
        EpisodeDownloader.removeDownload(forEpisode: episodeId)
        downloaded.remove(at: index)
        UserDefaults.standard.set(downloaded, forKey: "downloadedEpisodes")
    }

    // "square.and.arrow.down" iz "SF Symbols" za download
    // "wifi.slash" kad nema interneta
    // "rectangle.and.pencil.and.ellipsis" ili prosto "square.and.pencil" za Appstore (jer može da se piše autoru ili da se napiše review)
    func showDownload() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down"), style: .plain, target: self, action: #selector(startDownloading))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(startDownloading))
        }
        if AppDelegate.episodeDownloader.downloadCount() >= 10 {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    func showCancelDownload() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "x.square"), style: .plain, target: self, action: #selector(cancelDownload))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Otkaži", style: .plain, target: self, action: #selector(cancelDownload))
        }
    }

    func showAppstore() {
        let appstoreCount = UserDefaults.standard.integer(forKey: "appstoreCount")
        if appstoreCount >= 3 && AppDelegate.unseenCrashes == 0 {
            return
        }
        if AppDelegate.unseenCrashes > 0 {
           AppDelegate.unseenCrashes -= 1
        }
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(openAppstore))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Appstore", style: .plain, target: self, action: #selector(openAppstore))
        }
    }

    func showDeleteDownload() {
        if #available(iOS 14.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.bin"), style: .plain, target: self, action: #selector(deleteDownload))
        } else if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bin.xmark"), style: .plain, target: self, action: #selector(deleteDownload))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Obriši", style: .plain, target: self, action: #selector(deleteDownload))
        }
    }

    @objc func openAppstore() {
        var appstoreCount = UserDefaults.standard.integer(forKey: "appstoreCount")
        appstoreCount += 1
        UserDefaults.standard.set(appstoreCount, forKey: "appstoreCount")

        let url: URL?
        if AppDelegate.unseenCrashes > 0 {
            url = URL(string: "mailto:yckopo@gmail.com")
        } else {
            url = URL(string: "itms-apps://itunes.apple.com/app/id\(Assets.appId)")
        }

        if let url = url {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    @objc func doubleTap() {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.isNavigationBarHidden = !navigationController.isNavigationBarHidden
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // TODO: clear queues
    }

}
