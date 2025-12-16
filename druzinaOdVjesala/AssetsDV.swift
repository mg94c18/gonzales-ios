//
//  Assets.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 7/25/22.
//  Copyright © 2022 Stevanovic, Sasa. All rights reserved.
//

import Foundation

class Assets {
    static func loadNumbers() -> [String] {
        guard let cacheDir = ImageDownloader.cacheDir else {
            AppDelegate.log("WTF - Load numbers from where?")
            return []
        }
        guard let files = try? FileManager.default.contentsOfDirectory(at: cacheDir, includingPropertiesForKeys: nil) else {
            AppDelegate.log("WTF - No numbers to load")
            return []
        }
        var ret: [String] = []
        for file in files {
            if file.isFileURL {
                ret.append(file.deletingPathExtension().lastPathComponent)
            }
        }
        return ret.sorted()
    }

    static func loadFiles(forNumbers: [String], withExtension: String) -> [String] {
        var ret: [String] = []
        for number in forNumbers {
            ret.append(number)
        }
        return ret
    }

    // cat ../Gonzales/app/src/gonzales/assets/numbers | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    public static let numbers: [String] = loadNumbers()

    public static let titles: [String] = loadFiles(forNumbers: numbers, withExtension: ".title")
    
    public static let dates: [String] = loadFiles(forNumbers: numbers, withExtension: ".author")

    private static let CYRILLIC_MODE = "cyrillic_mode"
    private static var inCyrillic = UserDefaults.standard.bool(forKey: CYRILLIC_MODE)
    public static func toggleCyrillic() {
        inCyrillic = !inCyrillic
        UserDefaults.standard.set(inCyrillic, forKey: CYRILLIC_MODE)
    }

    public static let defaultEpisodeId: Int = 0

    static func indexPath(forEpisode episode: Int) -> IndexPath {
        let index = flavorIndex(forEpisode: episode)
        return IndexPath(indexes: [index.0, index.1])
    }

    private static func flavorIndex(forEpisode episode: Int) -> (Int, Int) {
        var index = episode
        for i in 0..<sectionInfo.count {
            if index < sectionInfo[i].1 {
                return (i, index)
            }
            index -= sectionInfo[i].1
        }
        AppDelegate.log("WTF - episode \(episode) can't be found")
        return (0, 0)
    }

    static func pages(forEpisode episode: Int, withTranslation: String = "") -> [String] {
        let index = flavorIndex(forEpisode: episode)
        let number = numbers[episode]
        let bucketSuffix = sectionInfo[index.0].2
        var ret: [String] = []

        if ret.isEmpty {
            ret = ["https://mg94c18\(bucketSuffix).fra1.digitaloceanspaces.com/\(number).mp3"]
        }

        return ret
    }
    
    static var averageEpisodeSizeMB = 67
    
    static let sectionInfo: [(String, Int, String)] = [
        ("", titles.count, "gonzales")
    ]

    static let appId = 6737076067
}
