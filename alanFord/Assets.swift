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
    public static let numbers: [String] = ["abvgd","igramo2","udva","ostaricu","daj","zlatibore","kolena","lutka2","kukavica","insomnia","jorgovani","ljubavje","ajasam2","pape","inat","li","hajde","kadbi2","mogli","nikadniko","TjeloHristovo","pozdravi","opilo","takotreba","koljena","zohari","bubaerdeljan","zenidba","druze","samorata","necevatra","gru","nevolem","novak","anketaa","anketab","anketav","anketag","mrtavladan","studios","pub"]

    public static var titles = inCyrillic ? titlesCyrillic : titlesLatin
    private static let titlesLatin: [String] = ["Rozeta stoun","Igramo se, igramo","U dva će čistači odneti đubre","Ostariću, neću znati","Daj, ne pitaj","Pesma o Zlatiboru i Tari","Dodirni mi kolena","Lutka sa naslovne strane","Nisam znala da si takva kukavica","Tvoje su usne bile ukusne","Kad zamirišu jorgovani","Ljubav je...","Ti si me čekala","Oprosti mi pape","Nijedna želja, iz inata","Jesi li sama večeras?","Hajde da se volimo","Kad bi bio bijelo dugme","Sve smo mogli mi","Nikad te niko neće voljet ko ja","Tjelo Hristovo","Pozdravi = pozdravi","Opilo nas vino","Danas nema mleka","Dodirni mi koljena","Balada o Pišonji i Žugi","Šta ti je trebalo to?","Medvedova ženidba","Druže","Samo da rata ne bude","Neće vatra kraj slame","Za tebe uvek biću tu","Namćor","Bog i anđeli čuvari","Pitali su građane","Građani odgovaraju","Odgovori građana","Na ulici sa građanima","Gde je deda?","Svađanje u studiju","🏆 Boža zvani Pub."]
    private static let titlesCyrillic: [String] = ["Розета стоун","Играмо се, играмо","У два ће чистачи однети ђубре","Остарићу, нећу знати","Дај, не питај","Песма о Златибору и Тари","Додирни ми колена","Лутка са насловне стране","Нисам знала да си таква кукавица","Твоје су усне биле укусне","Кад замиришу јорговани","Љубав је...","Ти си ме чекала","Опрости ми папе","Ниједна жеља, из ината","Јеси ли сама вечерас?","Хајде да се волимо","Кад би био бијело дугме","Све смо могли ми","Никад те нико неће вољет ко ја","Тјело Христово","Поздрави = поздрави","Опило нас вино","Данас нема млека","Додирни ми кољена","Балада о Пишоњи и Жуги","Шта ти је требало то?","Медведова женидба","Друже","Само да рата не буде","Неће ватра крај сламе","За тебе увек бићу ту","Намћор","Бог и анђели чувари","Питали су грађане","Грађани одговарају","Одговори грађана","На улици са грађанима","Где је деда?","Свађање у студију","🏆 Божа звани Пуб."]

    public static var dates = inCyrillic ? datesCyrillic : datesLatin
    private static var datesLatin: [String] = ["Rambo Amadeus","Ljupka Dimitrovska","Bora Čorba","Haris Džinović","Viktorija","Slobodan Mulina","Zana Nimani","Bora Čorba","Ceca Ražnatović","Viktorija, Dino Dvornik","Dino Merlin, Vesna Zmijanac","Željko Joksimović, Mina Joksimović","Predrag Živković Tozovac","Oliver Dragojević","Seid Memić Vajta","Džoni Štulić","Lepa Brena, Slatki greh","Željko Bebek","Jadranka Stojaković","Seid Memić Vajta","Danica Crnogorčević","Miroslav Ilić","Merima Njegomir","Bora Čorba","Severina","Zabranjeno pušenje","Đorđe Balašević","Dobrila Matić, Ljubiša Bačić, Žiža Stojanović, Dragan Laković","Beogradski sindikat","Darija Vračević","Rade Jorović","Dalibor Andonov Gru, Modelsice, Niggor","Đorđe Balašević","Novak Đoković, SportalRS","Alo! anketa","Alo! anketa","Alo! anketa","Alo! anketa","Mihajlo Jovanović, Olivera Marković, Branislav Zeremski, Nenad Jezdić, Srđan Todorović, Nikola Đuričko, Tara Manić, Sonja Kolačarić, Bata Paskaljević, Dušan Petrović, Ljubomir Ješić, Istok Tornjanski, Marko Milanković","1: Jovana Joksimović, Mlađan Đorđević; 2: Zoran Milanović; 3: Verica Bradić, Čeda Jovanović, Ceca Ražnatović; 4: Željko Komšić, Novinar; 5: Olja Bećković, Gledalac","Đorđe Balašević"]
    private static let datesCyrillic: [String] = ["Рамбо Амадеус","Љупка Димитровска","Бора Чорба","Харис Џиновић","Викторија","Слободан Мулина","Зана Нимани","Бора Чорба","Цеца Ражнатовић","Викторија, Дино Дворник","Дино Мерлин, Весна Змијанац","Жељко Јоксимовић, Мина Јоксимовић","Предраг Живковић Тозовац","Оливер Драгојевић","Сеид Мемић Вајта","Џони Штулић","Лепа Брена, Слатки грех","Жељко Бебек","Јадранка Стојаковић","Сеид Мемић Вајта","Даница Црногорчевић","Мирослав Илић","Мерима Његомир","Бора Чорба","Северина","Забрањено пушење","Ђорђе Балашевић","Добрила Матић, Љубиша Бачић, Жижа Стојановић, Драган Лаковић","Београдски синдикат","Дарија Врачевић","Раде Јоровић","Далибор Андонов Гру, Моделсице, Ниггор","Ђорђе Балашевић","Новак Ђоковић, СпорталРС","Ало! анкета","Ало! анкета","Ало! анкета","Ало! анкета","Михајло Јовановић, Оливера Марковић, Бранислав Зеремски, Ненад Јездић, Срђан Тодоровић, Никола Ђуричко, Тара Манић, Соња Колачарић, Бата Паскаљевић, Душан Петровић, Љубомир Јешић, Исток Торњански, Марко Миланковић","1: Јована Јоксимовић, Млађан Ђорђевић; 2: Зоран Милановић; 3: Верица Брадић, Чеда Јовановић, Цеца Ражнатовић; 4: Жељко Комшић, Новинар; 5: Оља Бећковић, Гледалац","Ђорђе Балашевић"]

    private static let CYRILLIC_MODE = "cyrillic_mode"
    private static var inCyrillic = UserDefaults.standard.bool(forKey: CYRILLIC_MODE)
    public static func toggleCyrillic() {
        inCyrillic = !inCyrillic
        UserDefaults.standard.set(inCyrillic, forKey: CYRILLIC_MODE)
        if inCyrillic {
            titles = titlesCyrillic
            dates = datesCyrillic
        } else {
            titles = titlesLatin
            dates = datesLatin
        }
    }

    public static let defaultEpisodeId: Int = 1

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
        
        // for f in $(cat ../Gonzales/app/src/dijaspora/assets/numbers); do for p in "" ".bukvalno" ".finalno" ".cirilica"; do cp ../Gonzales/app/src/dijaspora/assets/${f}${p} alanFord/Tekstovi/${f}${p}.txt; done; done
        // abvgd skipped in copying and also in forking
        let suffix = withTranslation.isEmpty && episode > 0 && inCyrillic ? ".cirilica" : withTranslation
        if let path = Bundle.main.path(forResource: number + suffix, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                ret += data.components(separatedBy: .newlines)
            } catch {
                AppDelegate.log("WTF - lines for episode \(episode)/'\(withTranslation)' can't be found")
            }
        }
        
        if withTranslation.isEmpty {
            ret[0] = "https://mg94c18\(bucketSuffix).fra1.digitaloceanspaces.com/\(number).mp3"
        }
        
        return ret
    }
    
    static var averageEpisodeSizeMB = 67
    
    static let sectionInfo: [(String, Int, String)] = [
        ("", titles.count, "dijaspora")
    ]

    static let appId = 6737143330
}
