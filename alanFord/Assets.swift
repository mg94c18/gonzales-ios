//
//  Assets.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 7/25/22.
//  Copyright © 2022 Stevanovic, Sasa. All rights reserved.
//

import Foundation

class Assets {
    // cat ../Gonzales/app/src/dijaspora/assets/numbers | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    public static let numbers: [String] = ["abvgd","igramo2","udva","ostaricu","daj","zlatibore","kolena","lutka2","kukavica","insomnia","jorgovani","ljubavje","ajasam2","pape","inat","li","hajde","kadbi2","mogli","nikadniko","TjeloHristovo","pozdravi","opilo","takotreba","koljena","bubaerdeljan","zohari","zenidba","nijedna","druze","samorata","necevatra","gru","nevolem","novak","anketa2","kengur2","studio","pub"]

    public static let titles: [String] = ["ABVGD","Igramo se, igramo","U dva će čistači odneti đubre","Ostariću, neću znati","Daj, ne pitaj","Pesma o Zlatiboru i Tari","Dodirni mi kolena","Lutka sa naslovne strane","Nisam znala da si takva kukavica","Tvoje su usne bile ukusne","Kad zamirišu jorgovani","Ljubav je...","Ti si me čekala","Oprosti mi pape","Nijedna želja, iz inata","Jesi li sama večeras?","Hajde da se volimo","Kad bi bio bijelo dugme","Sve smo mogli mi","Nikad te niko neće voljet ko ja","Tjelo Hristovo","Pozdravi = pozdravi","Opilo nas vino","Danas nema mleka","Dodirni mi koljena","Šta ti je trebalo to?","Balada o Pišonji i Žugi","Medvedova ženidba","Nijedna zora ne svane","Druže","Samo da rata ne bude","Neće vatra kraj slame","Za tebe uvek biću tu","Namćor","Bog i anđeli čuvari","Prednosti i mane grada","Molitva za fudbal","Svađa u studiju","🏆 Boža zvani Pub."
    ]
    
    public static let dates: [String] = ["Rambo Amadeus","Ljupka Dimitrovska","Bora Čorba","Haris Džinović","Viktorija","Slobodan Mulina","Zana Nimani","Bora Čorba","Ceca Ražnatović","Viktorija, Dino Dvornik","Dino Merlin, Vesna Zmijanac","Željko Joksimović, Mina Joksimović","Predrag Živković Tozovac","Oliver Dragojević","Seid Memić Vajta","Džoni Štulić","Lepa Brena, Slatki greh","Željko Bebek","Jadranka Stojaković","Seid Memić Vajta","Danica Crnogorčević","Miroslav Ilić","Merima Njegomir","Bora Čorba","Severina","Đorđe Balašević","Zabranjeno pušenje","Dobrila Matić, Ljubiša Bačić, Žiža Stojanović, Dragan Laković","Biljana Jevtić","Beogradski sindikat","Darija Vračević","Rade Jorović","Dalibor Andonov Gru, Modelsice, Niggor","Đorđe Balašević","Novak Đoković, SportalRS","Alo! anketa","Kad porastem biću Kengur","Jovana Joksimović, Mlađan Đorđević","Đorđe Balašević"
    ]
    

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
        // TODO: Log.wtf
        assert(false)
        return (0, 0)
    }

    static func pages(forEpisode episode: Int, withTranslation: String = "") -> [String] {
        let index = flavorIndex(forEpisode: episode)
        let number = numbers[episode]
        let bucketSuffix = sectionInfo[index.0].2
        var ret: [String] = []
        
        // for f in $(cat ../Gonzales/app/src/dijaspora/assets/numbers); do for p in "" ".bukvalno" ".finalno"; do cp ../Gonzales/app/src/dijaspora/assets/${f}${p} alanFord/Tekstovi/${f}${p}.txt; done; done
        if let path = Bundle.main.path(forResource: number + withTranslation, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                ret += data.components(separatedBy: .newlines)
            } catch {
                // TODO: Log.wtf
            }
        }
        
        if ret.isEmpty {
            ret = ["https://mg94c18\(bucketSuffix).fra1.digitaloceanspaces.com/\(number).mp3"]
        }
        
        return ret
    }
    
    static var averageEpisodeSizeMB = 67
    
    static let sectionInfo: [(String, Int, String)] = [
        ("", titles.count, "dijaspora")
    ]

    // TODO: promeniti
    static let appId = 1643426345
}
