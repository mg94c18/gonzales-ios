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
    public static let numbers: [String] = ["valemucho","interesas","manuela","nada","elrey","llorona","recordaras","libroviejo","quizas","baila2","tienesabor","basurita","sumujer2","aveces2","besame","perdi","cielorojo2","hastasiempre","cuerpo","hermoso","recuerdos2","hey2","chatarra","lutte","carretera","querria","hubierasabido","seranovia","unomas","volvera","volverb","encuestaamor","shakira"]

    public static let titles: [String] = ["Para siempre","Ya no me interesas","Manuela","No me importa nada","El rey","La llorona","Un ano de amor","Pedacito de papel","Quizás, quizás, quizás","Baila morena","Tiene sabor","La basurita","Quién es ese hombre","A veces tú, a veces yo","Besame mucho","Estos celos","Cielo rojo","Hasta siempre, comandante","Tu sangra en mi cuerpo","Hermoso cariño","Entre mis recuerdos","Hey","Chatarra","Lutte","Carretera","Querria","Si hubiera sabido ayer","Los Serrano 1","Uno más uno son siete","Volver 1","Volver 2","Encuesta - Bilbao","Entrevista - Las mujeres ya no lloran"]
    
    public static let dates: [String] = ["Vicente Fernández","Lucha Villa","Julio Iglesias","Luz Casal","Vicente Fernández","Chavela Vargas","Luz Casal","Buena Vista Social Club","Trio Los Panchos","Julio Iglesias","Omara Portuondo","Flor Silvestre","Zharick León","La Apuesta","Consuelo Velázquez","Vicente Fernández","Flor Silvestre","Carlos Puebla y sus Tradicionales","Ana Bertha Castellanos, Jesús Castellanos","Vicente Fernández","Luz Casal","Julio Iglesias","Waor, El Jincho, Brawler","Ayax y Prok, Fernandocosta","Natos, Waor, Recycled J","El Kanka","Joan Sebastian","Jorge Jurado, Antonio Resines, Víctor Elías, Fran Perea, Belén Rueda","Fran Perea","Carmen Maura, Lola Dueñas, Penélope Cruz, Leandro Rivera","Leandro Rivera, Penélope Cruz, Yohana Cobo, Lola Dueñas","Encuesta sobre el amor 2.0","Shakira, Lili Estefan"]

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
        ("", titles.count, "gonzales")
    ]

    // TODO: promeniti
    static let appId = 1643426345
}
