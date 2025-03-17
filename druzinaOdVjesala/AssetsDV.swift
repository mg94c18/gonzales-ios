//
//  Assets.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 7/25/22.
//  Copyright © 2022 Stevanovic, Sasa. All rights reserved.
//

import Foundation

class Assets {
    // cat ../Gonzales/app/src/gonzales/assets/numbers | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    public static let numbers: [String] = ["valemucho","escucha","interesas","manuela","nada","elrey","llorona","recordaras","libroviejo","quizas","baila2","tienesabor","basurita","sumujer2","aveces2","besame","perdi","tumedas","hastasiempre","cuerpo","recuerdos2","hey2","fuiste","chatarra","querria","hubierasabido","seranovia","unomas","volver","macario","sondeoa","shakira","futuros","nosdieron","sondeob","pluma","calle","sondeov","nodal","universitarios","sondeog"]

    public static let titles: [String] = ["Para siempre","Escúchame","Tú a mi ya no me interesas","Manuela","No me importa nada","El rey","La llorona","Un año de amor","Pedacito de papel","Quizás, quizás, quizás","Baila morena","Tiene sabor","La basurita","Quién es ese hombre","A veces tú, a veces yo","Besame mucho","Estos celos","Tan sólo tú","Hasta siempre, comandante","Tu sangra en mi cuerpo","Entre mis recuerdos","Ese siempre fui yo","Eras, pero ahora no eres","Chatarra","Querria","Si hubiera sabido ayer","Los Serrano 1","Uno más uno son siete","Su fantasma o su espíritu","Un guajolote para el solo","Guanajuato - 1","Las mujeres ya no lloran","De primaria - futuros","Y nos dieron las diez","Guanajuato - 2","Entrevista - Pluma","De primaria - calle","Guanajuato - 3","Entrevista - Nodal","De primaria - universitarios","Guanajuato - final"]
    
    public static let dates: [String] = ["Vicente Fernández","Aguilas de America","Lucha Villa","Julio Iglesias","Luz Casal","Vicente Fernández","Chavela Vargas","Luz Casal","Buena Vista Social Club","Trio Los Panchos","Julio Iglesias","Omara Portuondo","Flor Silvestre","Zharick León","La Apuesta","Consuelo Velázquez","Vicente Fernández","Franco De Vita, Alejandra Guzmán","Carlos Puebla y sus Tradicionales","Ana Bertha Castellanos, Jesús Castellanos","Luz Casal","Julio Iglesias","Gilda","Waor, El Jincho, Brawler","El Kanka","Joan Sebastian","Jorge Jurado, Antonio Resines, Víctor Elías, Fran Perea, Belén Rueda","Fran Perea","Carmen Maura, Lola Dueñas, Penélope Cruz, Leandro Rivera, Yohana Cobo","Pina Pellicer, Ignacio López Tarso, José Gálvez, José Luis Jiménez, Enrique Lucero","Tv Guanajuato Canal 8","Shakira, Lili Estefan","Charlyokei","Joaqin Sabina","Tv Guanajuato Canal 8","Clarissa Molina, Peso Pluma","Charlyokei","Tv Guanajuato Canal 8","Raúl de Molina, Christian Nodal","Charlyokei","Tv Guanajuato Canal 8"]

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
        assert(false)
        return (0, 0)
    }

    static func pages(forEpisode episode: Int, withTranslation: String = "") -> [String] {
        let index = flavorIndex(forEpisode: episode)
        let number = numbers[episode]
        let bucketSuffix = sectionInfo[index.0].2
        var ret: [String] = []

        // for f in $(cat ../Gonzales/app/src/gonzales/assets/numbers); do for p in "" ".bukvalno" ".finalno" ".bukvalno.cirilica" ".finalno.cirilica"; do cp ../Gonzales/app/src/gonzales/assets/${f}${p} druzinaOdVjesala/Tekstovi/${f}${p}.txt; done; done
        let suffix = !withTranslation.isEmpty && inCyrillic ? withTranslation + ".cirilica" : withTranslation
        if let path = Bundle.main.path(forResource: number + suffix, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                ret += data.components(separatedBy: .newlines)
            } catch {
                AppDelegate.log("WTF - lines for episode \(episode)/'\(withTranslation)' can't be found")
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

    static let appId = 6737076067
}
