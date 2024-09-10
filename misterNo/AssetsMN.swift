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
    static let numbers: [String] = ["001","004","005","006","007","008","009","010","011","012","013","014","015","017","019","018","020","021","022","023","024","025","026","027","028","029","030","031","033","034","035","036","037","038","039","040","042","043","046","047","048","049","050","051","053","055","056","057","058","059","060","061","062","063","065","066","067","068","069","070","072","073","074","076","077","078","079","080","081","082","084","085","086","087","088","089","091","092","093","094","095","096","097","098","099","100","101","102","103","105","106","107","108","109","110","112","113","114","115","116","117","118","119","120","121","123","124","125","127","128","129","130","131","132","133","134","136","137","138","139","140","141","143","144","145","146","147","148","149","150","152","153","154","155","156","157","158","159","161","162","163","164","165","167","168","169","170","171","172","174","175","177","178","179","181","182","183","185","186","187","188","189","191","192","193","194","195","197","198","200","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","275","276","277","278","279","280","281","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","345","346","347","348","349","350","351","352","353","354","355","356","357","358","359","360","361","364","365","366","367","368","369","370","371","372","373","374","375","376","377","378","379"]

    // cat app/src/alanFord/assets/titles | gunzip - | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    static let titles: [String] = ["Dijamantska klopka","Poslednji Kangačeiro","Presuda Fonseku","U čeljusti jaguara","Bubnjevi u džungli","Gusari Amazona","Čovek s maskom","Zaseda u močvari","Zla kob","Usijanje","Crna reka","Senke u noći","Prokletstvo Maja","Tajni agent","Zlokobna močvara","Operacija 'Posejdon'","Bekstvo","Velika pljačka","Mambo, Mambo ...","Operacija 'Pajper'","Drama u zalivu","Hangadeirosi","Hulja","Zlatna čerbatana","Dijamanti","Tajanstveni grad","Bandit","El Loko","Zov Agvanura","Utvara jaguar","Crna kandža","Probodena džungla","Surova zemlja","Plaćenik","U krugu smrti","Dvostruka ucena","Čudo neviđeno","U zemlji Morosa","Pobuna","Eldorado","Lešinari","Tragični susret","Špijunska mreža","Tovar B-24","Prokleti most","Nestali avion","Smrtonosni tovar","Hodnik za pakao","Zakon osvete","Bekstvo sa Kajene","Rongo-Rongo","Znak moći","Tangata-manu","Janoama","Plavi đavo","Crno zlato","Čovek iz Akapulka","Žigosan kao ubica","Gaučo Ramon","Pazi, Snima se!","Leteći đavoli","Krvavi sneg","Pakleni plan","Mafija ne prašta","Umreti na Kapriju","Strah na Karibima","Zarobljeni na dnu","Nemoguće bekstvo","Dečak Santjago","Mupuku i jaguar","Dvoboj na nebu","Begunci","Licem u lice","Sukob u suton","Grad zločina","Gangsteri","Ananga","Duh zla","Ledeni pakao","Bijeli užas","Izgubljena utvrda","Ukleta kula","Fantom u operi","Tajni prolaz","Čovjek koji je previše znao","Džungla","Mesečeve planine","Zlatni kavez","Tajna Atakame","Crvene senke","Vestern Džona Trevora","Vatreno popodne","UFO","Čovek iz svemira","Kralj džungle","Karipune","Noć u Trinidadu","U vodama Kariba","Vrh u magli","Smaragdi","Prorok","Paukova mreža","Streljački vod","Pilot uragana","Lov na mikrofilm","Plamen mržnje","Obaveštajac","Zona Rio Uruku","Zmajevi sa Komoda","Sera Kobras","Kavasaki-56","Saslušanje","Samoubilački napad","Etrurski demon","Baukova usta","Otrovna strela","Bez milosti","Put u smrt","Noć čudovišta","Čarobnjak Hel","Dobrodošlica u Trinidadu","Surat kan","Iščezla ekspedicija","Biljke ubice","Vazdušni gusar","Leteći tigrovi","Žuto nebo","Samuraj Saiko","Noć Mačeta","Kuća Bogova","Gospodarica tajne","Ubica iz senke","Krunski svedok","Dvoboj na Pantanalu","Vrata pakla","Obmana","Avet sa Rio Kujabe","Osveta kapetana Teksejre","Bezimeni protivnik","Verakruz","Apolonijino prokletstvo","Žrtveni zdenac","Putnica bez prtljaga","Afrika","Safari","Ritualne maske","Čuvari divljine","Braća po krvi","Kraljevstvo Fanga","Planina lobanja","Pirati iz Gvineje","Najrobi autostop","Trgovci slonovačom","Pobuna Masaja","Mau-Mau","Oluja nad Kenijom","Vrač Kikujua","Al Azif","Zaboravljeni faraon","Lavirint opsena","Sahara","Groblje kamenih zmija","Legionari","Bogovi okruglih glava","Fort Motilinski","Blago afričkog korpusa","Dvojica protiv svih","Muzika maestro!","Pesma očajnika","Sedmorica sa 'Santa Cruza'","Posljednje oružje","Sotonski znakovi","Gospodar mraka","Pokolj","Indijanski ratnik","Bez milosti","Smrtne osude","Nesreća u prašumi","Preživjeli","Ledena tamnica","Povratak 'Tigrova'","Zlatni trokut","Legenda o Butchu Cassidyju","Patagonija","Kolumbijac","Dvoje na meti","Štovatelji zla","Barun Samedi","'Casablanca cafe'","Dubine","Zatrovana laguna","Prvak","Otmičari","Ratni zarobljenik","Heroji bez slave","Ludo smioni","Matador","Fiesta smrti","Očajnički sati","Ninja!","Čovjek bez prošlosti","Istraga visoka rizika","Zločinački mozaik","Unakrsna vatra","Zaboravljeni grad","Kamena zamka","Projekt 'Pegaz'","Primitivan narod","Dan lešinara","Crveni vjetar","Morski psi","Junačka krv","Otok izgubljenih dana","Opasne igre","Bijeg iz pakla","Tajna kripte","Stranac u Redencionu","Zemlja bezakonja","Granica","Čudovište iz močvare","Vatreni uragan","Pasji dan","Dark city","Sjeme mržnje","Presuda","Iza maske","Povratak u New York","Neprijateljeva sjena","Opasne vode","Vreme nasilja","Ljudi bez nade","Samoubilačka misija","Šuma tajni","Beli indijanac","Krv ratnika","Dvadeset godina kasnije","Zemlja i sloboda","Izdajnik","Posledwa granica","Lovci i lovina","Užas u džungli","Serijski ubica","Pobuna","Pod znakom avanture","Gvadal kanal!","Godišnje doba u paklu","Na tragu gospodina Kaplana","Oči u tami","Na ivici ambisa","Noć žrtvovanja","Pobunjenik Huanito","Odblesci bitke","Nemilosrdni lov","Prijatelj u opasnosti","Gringov izazov","Teror Rio Negra","U piratskoj jazbini","Smrt u Manausu","Senka škorpiona","Osuđenici iz rudnika","Opsada","Avantura na Kordiljerima","Dva života u igri","Prokleta reka","Teritorija Hivaroa","Vruća fotografija","Pravac Los Anđeles","Atentat","Spletke na vrhu","Crna berza smrti","Indokina","Staza uspomena","Buđenje zmaja","Krvavi tragovi","Poslednje vatre","Tajanstvena Burma","Zabranjeni hram","Atomska uzbuna","Rat špijuna","U kineskim morima","Makao","Cena izdaje","Progonjeni","Predskazanja smrti","Pobednici i pobeđeni","Rio de Žaneiro","Ukradeni pajper","Priča o vojniku","Ljudi i heroji","Vreme ubica","Osveta!","Ujed pirane","Oteta devojka","U srcu džungle","Majanski idol","Pravda Janoama","Krv u raju","Prljavi novac","Trka s vremenom","Čovek iz budućnosti","Pokajnik","Zamka za miševe","Blago Saint-Exuperya","Pretnja prošlosti","Nešto se promenilo","Neobičan susret","Vatra i krv","Ajauaska","Delirijum","Zaseda na 'Viktoriji'","Lepa gomila kruzeira","Šuma u plamenu","Krugerov izazov","Empate","Zabava je završena","Misija Majari","U potrazi za Kamanauom","Crvena stena","Crna laguna","Novi život"
    ]
    
    static let dates: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    
    // for a in $(cat app/src/alanFord/assets/numbers | gunzip - ); do echo -n \"${a}\":; cat app/src/alanFord/assets/$a | gunzip - | wc -l; done | tr '\n' ','
    static let nposPage: [String:Int] = ["001":93,"004":94,"005":93,"006":93,"007":83,"008":95,"009":93,"010":93,"011":95,"012":95,"013":94,"014":95,"015":94,"017":95,"019":93,"018":93,"020":91,"021":95,"022":81,"023":94,"024":90,"025":90,"026":81,"027":95,"028":95,"029":85,"030":65,"031":63,"033":45,"034":95,"035":95,"036":89,"037":68,"038":92,"039":89,"040":92,"042":48,"043":89,"046":61,"047":94,"048":95,"049":79,"050":87,"051":50,"053":46,"055":83,"056":69,"057":95,"058":95,"059":91,"060":95,"061":94,"062":95,"063":93,"065":93,"066":92,"067":59,"068":91,"069":75,"070":91,"072":91,"073":82,"074":46,"076":93,"077":92,"078":90,"079":93,"080":62,"081":93,"082":94,"084":91,"085":92,"086":62,"087":91,"088":89,"089":92,"091":94,"092":97,"093":98,"094":98,"095":98,"096":98,"097":98,"098":100,"099":99,"100":95,"101":95,"102":85,"103":92,"105":88,"106":85,"107":48,"108":93,"109":94,"110":92,"112":75,"113":91,"114":92,"115":92,"116":43,"117":97,"118":97,"119":100,"120":90,"121":76,"123":46,"124":95,"125":95,"127":65,"128":94,"129":94,"130":75,"131":91,"132":94,"133":73,"134":90,"136":94,"137":93,"138":93,"139":46,"140":92,"141":93,"143":95,"144":93,"145":93,"146":94,"147":93,"148":65,"149":94,"150":94,"152":92,"153":94,"154":37,"155":94,"156":94,"157":94,"158":94,"159":42,"161":51,"162":94,"163":94,"164":70,"165":94,"167":94,"168":94,"169":79,"170":93,"171":93,"172":81,"174":95,"175":94,"177":94,"178":94,"179":53,"181":94,"182":94,"183":94,"185":94,"186":52,"187":55,"188":94,"189":94,"191":95,"192":94,"193":44,"194":93,"195":94,"197":61,"198":60,"200":112,"202":95,"203":95,"204":95,"205":95,"206":95,"207":95,"208":87,"209":95,"210":95,"211":95,"212":95,"213":95,"214":95,"215":95,"216":95,"217":95,"218":95,"219":95,"220":95,"221":95,"222":95,"223":95,"224":95,"225":95,"226":95,"227":95,"228":95,"229":95,"230":95,"231":95,"232":95,"233":95,"234":95,"235":95,"236":95,"237":95,"238":95,"239":95,"240":95,"241":95,"242":95,"243":95,"244":95,"245":95,"246":95,"247":95,"248":95,"249":95,"250":95,"251":95,"252":95,"253":95,"254":95,"255":95,"256":95,"257":95,"258":95,"259":95,"275":95,"276":95,"277":95,"278":95,"279":95,"280":95,"281":95,"292":95,"293":95,"294":95,"295":95,"296":95,"297":95,"298":95,"299":95,"300":95,"301":95,"302":95,"303":95,"304":95,"305":95,"306":95,"307":95,"308":93,"309":95,"310":95,"311":95,"312":95,"313":95,"314":95,"315":95,"316":95,"317":95,"318":95,"319":95,"320":95,"321":95,"322":95,"323":95,"324":95,"325":95,"326":95,"327":95,"328":95,"329":95,"330":95,"331":95,"332":95,"333":95,"334":95,"335":95,"336":95,"337":95,"338":95,"339":95,"340":96,"341":97,"342":98,"343":96,"345":99,"346":100,"347":99,"348":100,"349":100,"350":100,"351":100,"352":99,"353":99,"354":98,"355":98,"356":99,"357":98,"358":98,"359":99,"360":96,"361":95,"364":95,"365":95,"366":97,"367":97,"368":97,"369":97,"370":97,"371":96,"372":96,"373":100,"374":96,"375":96,"376":96,"377":96,"378":96,"379":96]
    
    static func firstPage(forEpisode episode: String) -> Int {
        switch episode {
        case "119": return 2
        case "200": return 2
        case "340": return 2
        case "341": return 3
        case "342": return 3
        case "343": return 2
        case "345": return 3
        case "346": return 4
        case "347": return 3
        case "348": return 3
        case "349": return 3
        case "350": return 3
        case "351": return 3
        case "352": return 2
        case "353": return 2
        case "356": return 2
        case "359": return 2
        case "360": return 2
        default: return 1
        }
    }

    static func pages(forEpisode episode: String) -> [String] {
        let commonExtension = commonPageExtension(forEpisode: episode)
        return ["https://yugostripmisterno.fra1.digitaloceanspaces.com/\(episode)/\(episode)_000.\(coverPageExtension(forEpisode: episode))"]
        + (firstPage(forEpisode: episode)..<nposPage[episode]!).map{"https://yugostripmisterno.fra1.digitaloceanspaces.com/\(episode)/\(episode)_\(String(format: "%03d", $0)).\(commonExtension)"}
    }
    
    static func pages(forEpisode episode: Int) -> [String] {
        return pages(forEpisode: numbers[episode])
    }

    static var averageEpisodeSizeMB = 54
    
    static func coverPageExtension(forEpisode: String) -> String {
        return "jpg"
    }

    static func commonPageExtension(forEpisode: String) -> String {
        return "jpg"
    }
    
    static let appId = 6461122503
}
