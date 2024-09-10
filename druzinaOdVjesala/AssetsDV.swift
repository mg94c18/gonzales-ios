//
//  Assets.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 7/25/22.
//  Copyright © 2022 Stevanovic, Sasa. All rights reserved.
//

import Foundation

class Assets {
    // cat app/src/alanFord/assets/numbers | gunzip - | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    static let numbers: [String] = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20"]

    // cat app/src/alanFord/assets/titles | gunzip - | tr '"' "'" | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    static let titles: [String] = ["Obješenjaci","Kastelan Kobac","Otmica Analize","Kraljevstvo od Ljepovida","Turnir turnira","Povratak Leoparda","Sedmorica mudroglavih","Morska mačka","Crnorižac","Emir od Suharka","Kraljevski slastičar","Prokleta plovidba","Robovi Punisa","Leteći sag","Doktor Nadir","Ruža nesloge","Sijamski duhovi","Plamena ljepotica","Početak kraja","Završni račun"]
    
    static let dates: [String] = ["","","","","","","","","","","","","","","","","","","",""]
    
    // for a in $(cat app/src/alanFord/assets/numbers | gunzip - ); do echo -n \"${a}\":; cat app/src/alanFord/assets/$a | gunzip - | wc -l; done | tr '\n' ','
    static let pageCount: [String:Int] = ["01":126,"02":124,"03":124,"04":122,"05":115,"06":124,"07":121,"08":124,"09":124,"10":123,"11":123,"12":124,"13":124,"14":124,"15":124,"16":123,"17":123,"18":123,"19":123,"20":123]
    
    static func firstPage(forEpisode episode: String) -> Int {
        switch episode {
        case "01": return 4
        case "02"..."15": return 3
        case "16"..."20": return 2
        default: return 0
        }
    }

    static func pages(forEpisode episode: String) -> [String] {
        let commonExtension = commonPageExtension(forEpisode: episode)
        return ["https://yugostripdruzinaodvjesala.fra1.digitaloceanspaces.com/\(episode)/\(episode)_000.\(coverPageExtension(forEpisode: episode))"]
        + (firstPage(forEpisode: episode)..<pageCount[episode]!).map{"https://yugostripdruzinaodvjesala.fra1.digitaloceanspaces.com/\(episode)/\(episode)_\(String(format: "%03d", $0)).\(commonExtension)"}
    }
    
    static func pages(forEpisode episode: Int) -> [String] {
        return pages(forEpisode: numbers[episode])
    }

    static var averageEpisodeSizeMB = 67
    
    static func coverPageExtension(forEpisode: String) -> String {
        return "jpg"
    }

    static func commonPageExtension(forEpisode: String) -> String {
        return "jpg"
    }
    
    static let appId = 1645465825
}
