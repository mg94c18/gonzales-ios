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
    private static let numbers_alanFord: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","344","345","346","347","348","349","350","351","352","353","354","355","356","357","358","359","360","361","362a","362b","363","364","365","366","367","368","369","370","371","372","373a","373b","374a","374b","375","376","377","378","379","380","381","382","383","384","385","386a","386b","387a","387b","388","389","390","391","392","393","394","395","396","397","398","399","400","401","402","403","404","405","406","407","408","409","410","411","412","413","414","415","416","417","418","419","420","421","422","423","424","425","426","427","428","429","430","431","432","433","434","435","436","437","438","439","440","441","442","443","444","445","446","447","448","449","450","451","452","453","454","455","456","457","458","459","460","461","462","463","464","465","466","467","468","469","470","471","472","473","474","475","476","477","478","479","480","481","482","483","484","485","486","487","488","489","490","491","492","493","494","495","496","497","498","499","500","501","502","503","504","505","506","507","508","509","510","511","512","513","514","515","516","517","518a","518b","519","520","521","522","523","524","525","526","527","528","529","530","S01","S02","S03","S04","S05","S06","S07","S08","S09","S10","S11","S12","S13","S14","S15"
    ]

    // cat app/src/alanFord/assets/titles | gunzip - | tr '"' "'" | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    private static let titles_alanFord: [String] = ["Grupa TNT","Šuplji zub","Operacija Frankenstein","Kuća duhova","Daj! Daj! Daj!","Traži se Alex Barry","Ucviljeni diktator","Zimska idila","ZOO simfonija","Formule","Broj jedan","Žalosna priča o mladom bogatašu","Golf","1,2,3,4","Udar munje ","(Ne) glasajte za Notaxa","Ljekovita voda","Pas za milijun dolara","Trojica iz Yume","Frit i Frut","Čuvaj se bombe","U strahu su velike oči","San jedne zimske noći","U potrazi za bombom","Skok na skok","Superhik","Superhik, alkohol prijeti","Superhik, razbijena boca","Cirkus","Bradati pljačkaši ","Dan vještica","Kad srce radi bi-bim, ba-bam","Pljačkaš","Vesela dolina","Dvanaest umjetnika","Centurion","Pukovnik Kattycat","Godišnji odmor","Dobra stara vremena","Ekologija","Slatka afera","Vrijeme darivanja","Novogodišnja proslava","Bila jednom nagrada","Klavirski koncert","Sve ili metak","Neprijatelj prirode broj jedan","Umro je bogati ujak","Derbi","Tako je nastala grupa TNT","Povratak Superhika","Superhikov veliki pothvat","Arsen Lupiga","Nestao je Bubu","Stupica za grupu TNT","Poziv na krstarenje","Spašavaj se tko može","Skok u prazno","Gužva u Monte Kablu","Udar","Krokodilska glava","Tri brata Rock","Isto, isto","Trio fantastikus","Udarac s boka (Luda trka)","Sumnjiv posao","Besplatni podvig","Sportska afera","Iznenadna ideja","U kolo s otmičarem","Susret s vampirom","Vampiri u New Yorku","Doktor Rakar","Superhik opet napada","Odlazak Superhika","Sjećam se ...","Podružnica","Veliki zadatak","Potraga za sinom","Nijagara","Bijeg Arsena Lupige","Putovanje raketom","Najcrnja kronika","Narednik Gruber","Veliki biznis","Hladni pol","Odluka u pravi čas","Beppa Joseph se vraća","Dobročinitelj","Bombaš","Pop art","Krck Fu","Ponovo Baby Kate","Piroman","Mjesec zove Skylab","Opasnost iz svemira","Zabranjen udarac","Djevojka zvana Brenda","Broadway","Crne planine Južne Dakote","Sastanak na groblju","Banda propalica","Nestanak kipa slobode","Šah-mat za trio Fantastikus","Veliki dan maharadže od Blitza","Do, re, mi","Safari bez veze","Daj, daj samuraj","Klodovikov podvig","Gumiflex","Tajna svinjske šunke","Hipnos","Drvena noga","Suha šljiva","Pravac Chicago","Stara dobra vremena","Opet živi Superhik","Kap vina previše ","Ralje","Katodik","Drvomorci","Dan osvete","Katodikova sjena","Iznenađenje pod krinkom","Viša rasa","Veliki šišač","Varalice","Ole, Meksiko","Karamba","Ostix!","Luna park","Hipnosova svirka","Vratio se Gumiflex","Gumiflexova osveta","Neuhvatljivi","Kuća zdravlja","Kartoffeln","Bob na bobu","Svečana večera","Nasljedstvo iz Teksasa","Tata-mata za reklamu","Morski pas koji govori","Novi Superhik","Smrtonosni zadah","Neprijatelj broj jedan","Rebus","Čudovište","Gužva na sastanku","Vurdalak je opet žedan","Kriminal & Comp","Pikova dvojka","Čarobna svjetiljka","Fetiš","Skupocjena marka","Melisa","Melisina melasa","Lov na Melisu","Grbavac","Grbavčeva tajna","Igra istine","Renato","O svemu i svačemu","Nevjerojatan povratak","Konspiratorova osveta","Bolnica Bez nade","Tajna loža P38","Posao još nije završen","Nijema papiga","Hitna pomoć","Nepredvidljivi","Superhikčina","Kron","Čovjek kompjuter","Ljeponoga Betty","Veliki banket","Festival","Čovjek iz Teksasa","Kako je završio smrdljivac Massey","Ružičasta majica za Boba","Olimpijski plamen","Pet metaka","Puk","Aerobik","Umro je broj jedan","Sjećanje na dragog pokojnika","Trostruka igra","Vražja dražba","Pokojnikova sjena","Trombovci, na okup!","Oporuka broja 1","Policijska njuška","Bobe, slučaj slanina je tvoj!","Spletke oko zavjere","Bakara","Zamrznut","Kakva gužva","Da se okladimo?","Srčani udar","Oskvrnjeni grob","Hik, hik, hura!","Lov na komarce","Trio socijalne pomoći","Crni gusar","Pan 2000","Žuta mrlja","Uživajte u pecivu","Zlatni pokal","Radioaktivni vampir","Malo strpljenja","Osveta šahom","Terorizam","Ukleti idol","Ubijte kritičara","Sir Oliver u nevolji","Ljevoruki udara","Crveni auto","Prudy, Prudy","Priviđenja","Tamne naočale","Osamljena srca","Hotelski miševi","O.Ž.V. Osiguranje životne vječnosti","Nježno ubijanje","Čudo od djeteta","I opet Superhik","Finale iznenađenja","Odgovori mi da se zbližimo!","Šifra grafiti","Bordighera ili smrt","Četvoročlana banda","ZOO ludorije","Perestrojka","Čistač Superhik javlja se na dužnost","Zimske radosti","Zatočenik kule","Tebi jasno?","Tako je počelo","Prokleta isprava","Samoubilački zadatak","Izdaja","Brodolom","Početak raspleta","Čovjek iz Londona","Ljepotica Ria","U sjeni giljotine","Potres","Skate-board boys","Posljednja bitka?","Finale","Veliki gazda (Kum)","Otrovni finale","Klopka sa tri S","Anten-men","Uhvatite Anten-men-a!","Povratak u tor","Elvis '90","Operacija spašavanja","Dovitljiva osveta","Ludost godine","Tražite Tobiju Quantrilla","Gero-skauti","Grob za Boba","Zippel","Državni psovač broj 1","Povratak Anten-mena ","Anten-menov dvojnik","Bum faktor","Pustinjski bljesak","Živa mumija","Mister Božić","Nijemi čovjek Turluk","Superzelembać","Ne glupiraj se!","Brazilska rumba ja-ja!","Nebeski pljačkaši ","Dan lavova","Anten-boy","Gledanost ili smrt","Tele-X","Operacija Pochita","Ne pucajte!","Vidimo se uskoro","Arakno","Tobia bježi","Prolećna simfonija (Ljetna simfonija)","Sad ga ima, sad ga nema!","S.O.S. Pochita","4 kostura","Gna, gna, gno","Ludnica u ludnici","Superhik ponovo među vama","Partija ujedinjenog podrigivanja","Kolo sreće","Pitanje savjesti","Ucjena za dvojicu","Mutni poslovi","Nesrećni dobitnik","Košarka","Crni dan","Primamljiv poziv","Klinika lake smrti","Pretrpljeni praznici","Morganina tajna","Banda četvrtastih glava","VIS Vurdalak","Mršav Božić","Blago Inka","Neslane šale","Bejzbol","Traži se Ivana","Anten-girl","Puff!","Krađa u muzeju","Grbavac napada","Morganin zatočenik","Superhik ponovo osvaja","Osveta u dimu","Božićni ugođaj","Čudo","Šaljivčina","Show Mauritza Trbonje","Telefon za prijatelja","Parabolik","Nestvarno vrijeme","Grbavac opet na djelu","Jaje iznenađenja","Povratak pauka","Oblaci","Pokajnik","Na pasjoj vrućini","Osveta","Mrvice","Dva srca i jedna koliba","E.B.","Da imam milijun dolara","Sapunica","Srdačno vaš lakrdijaš","Let USAF 317","Veliki Panzarotti","Hendikep","Glasujte za tromba","Božićna pljačka","31. prosinca 2097","Izgrebi i kidaj","Nasljedstvo Rock","Čarobni miris","Uhvaćen na djelu","Supermarket","Putovanja O.K. sve uključeno","Srčana","Lilihip","Plati 2, ubij 3","Živjeli otpaci","Moderna bajka (Božićni duh)","Htio bih mnogo, ali mogu malo","Sljepačke pjesme","Osvijetljena tikva","Sablast iz Cantervilea","Brojevi","Nevidljivi čovjek","Krstarenje au pair","Banderas Carreras","Zamršen slučaj","Ričard III","7 kila za 7 sati","Frick","Šakal","Zora novog tisućljeća","Meta ništica","Hamlet","Dvije sobe i kuhinja","Optuženi","Unajmljuje se ubojica","Hollywood wow!","Noć zvijezda","Minga i Manga","Sayonara","Ustanak Berta i Berte","Srodna duša","O, srce moje","Hakeri","Week-end","Slalom","Sladoled s ribljim okusom","TNT rođenje","Dimenzija XL","Poludjeli predsjednik","Kockar","Lakrdijašev TV show","Spot","Priče starih vremena","Priče starih vremena II","Povratak u dimenziju XL","Bomba kraj svijeta","Sretan Božić","Cogito ergo sum","Recite svoje","Ja mrtav, ti mrtav, on mrtav","Bingo!","Ubojstva izvlačenjem","Novi Anten-man","Oh moj Bože","Vodite ljubav sa...","Bilo pa prošlo","Proslava u dvorcu","Voyeurova banda","Božićna šala","Udovica s one strane groba","Enrika ponovo udara","Upitnik","Čudesni prsten","Posljednji film Billa Mikowskog","Ime mi je Font, Alex Font","Poziv smrti","Putnička agencija Shirley","Spasitelj","Fiction","Traži se osoblje","Bon-bon","Ars, artis","Mijaukanje tigra","Tajna triju upitnika","Tuča","Ubojica je ostavio svoj trag","Ra-ta-ta-ta-ta","Alcatraz","Gusari u napad!!!","Tri minute slave","Pax vobis","Zamorac","Grbavac Notre Dame","Prokletstvo mjeseca zelenog poput jabuke","Proročanstvo","Novi dan","Rasplet krimića","Svijet Alana Fonta","Puzzle","Minuettin minuet","Pri finoj pizzeriji","Troje za jednog","Superhikova sjena","Stari papir","Dar ili kvar","Moby Dick","Tajanstvena žena","Bandana Rock bend","Potreban je ... Supersirko","Hollywood zove","Operacija: Zaštita sigurnosti","Nagradni odmor","Idemo u operu","Supersirkov povratak","Krv duhova","Rasprodaja vampira","Otvara se number one","Zaručnici","Witchcraft","Na krilima oblaka","Veliki pokolj na otoku dosadnih","Sjajna ponuda","Samo za slabovidne","Ćorkanova banda","Havaji","Mat za Srčanu","Predstava","Smijem li se predstaviti? Geko Smrtić!","Svi u Las Vegas","Iza rešetaka","Žena bez pamćenja","Veseli udovac","Dnevnik Lulu Bell","Među nama je izdajica","Vraški zamršen slučaj","Svi na more?","Svi u planine!","Supersirkova prijetnja","Afera supersirko","Nikad ispričana priča","Ne smetaj","Meine liebe Minuette","Dolazi Paciulisky","Othello","Najprije treba poubijati sve odvjetnike","Lov na serijskog ubojicu","Problem zvan eksplozija","Ukroćena goropadnica","Odmor bez odmora","Zamrzni se danas, probudi se sutra","Magični dodir","Grof Monte Kristo","Zvonko Božić","Vjenčanje u troje","A što sad jadni Grunfe?","Zločini u ulici Morgue","Sav taj rock","Kao u dobra stara vremena","Druga stvar na popisu - Ubiti sve liječnike","Izlet na jezero","Ananas","Zagonetka limene kante","Tri kapi Superhika","Jadnici","Zločini u katedrali","Bogato nasljedstvo","Upravo vjenčani","Povratak s Marsa","Misterij dvije dimenzije","Bestseller","Kiseli medeni mjesec","Tajni zadatak","Dozvola","Blago Magnabenovih","Naručeno ubojstvo","Sve je u redu","Portret Doriana Graya","Ništa se nije dogodilo","Treća stvar na popisu - Ubiti sve knjigovođe","Sumnjivo samoubojstvo","Mačja ljubav","Iznenađenje","Čudni slučaj doktora Jackylla","Gumiflex - Razbojnik gumenog lica","Gumiflex - Slučaj nestalih pršuta","Gumiflex - Hipnos","Odmor među oblacima","U balonu","San mnogih zimskih noći","Božićna priča","Dracula","Vampiri","Glasujte za Alana","Zavjera u Parizu","Je li Minuette mrtva?","Frankenstein","Sve je otišlo kvragu","Je li ih netko vidio?","TNT u Beogradu kod Tita","Mračan posao","Drakula","Zločini lorda Savilea","Put oko svijeta u 80 dana","Doktor Džekil","Tri mušketira","Pinokio","Roštiljada","Džaba ti ovaj odmor","Trullalla-la-yeh","Sve uračunato","Božićna priča","Frankenstein","Zaručnici"
    ]
    
    private static let dates_alanFord: [String] = ["VII 1969.","VIII 1969.","IX 1969.","X 1969.","XI 1969.","XII 1969.","I 1970.","II 1970.","III 1970.","IV 1970.","V 1970.","VI 1970.","VII 1970.","VIII 1970.","IX 1970.","X 1970.","XI 1970.","XII 1970.","I 1971.","II 1971.","III 1971.","IV 1971.","V 1971.","VI 1971.","VII 1971.","VIII 1971.","IX 1971.","X 1971.","XI 1971.","XII 1971.","I 1972.","II 1972.","III 1972.","IV 1972.","V 1972.","VI 1972.","VII 1972.","VIII 1972.","IX 1972.","X 1972.","XI 1972.","XII 1972.","I 1973.","II 1973.","III 1973.","IV 1973.","V 1973.","VI 1973.","VII 1973.","VIII 1973.","IX 1973.","X 1973.","XI 1973.","XII 1973.","I 1974.","II 1974.","III 1974.","IV 1974.","V 1974.","VI 1974.","VII 1974.","VIII 1974.","IX 1974.","X 1974.","XI 1974.","XII 1974.","I 1975.","II 1975.","III 1975.","IV 1975.","V 1975.","VI 1975.","VII 1975.","VIII 1975.","IX 1975.","X 1975.","XI 1975.","XII 1975.","I 1976.","II 1976.","III 1976.","IV 1976.","V 1976.","VI 1976.","VII 1976.","VIII 1976.","IX 1976.","X 1976.","XI 1976.","XII 1976.","I 1977.","II 1977.","III 1977.","IV 1977.","V 1977.","VI 1977.","VII 1977.","VIII 1977.","IX 1977.","X 1977.","XI 1977.","XII 1977.","I 1978.","II 1978.","III 1978.","IV 1978.","V 1978.","VI 1978.","VII 1978.","VIII 1978.","IX 1978.","X 1978.","XI 1978.","XII 1978.","I 1979.","II 1979.","III 1979.","IV 1979.","V 1979.","VI 1979.","VII 1979.","VIII 1979.","IX 1979.","X 1979.","XI 1979.","XII 1979.","I 1980.","II 1980.","III 1980.","IV 1980.","V 1980.","VI 1980.","VII 1980.","VIII 1980.","IX 1980.","X 1980.","XI 1980.","XII 1980.","I 1981.","II 1981.","III 1981.","IV 1981.","V 1981.","VI 1981.","VII 1981.","VIII 1981.","IX 1981.","X 1981.","XI 1981.","XII 1981.","I 1982.","II 1982.","III 1982.","IV 1982.","V 1982.","VI 1982.","VII 1982.","VIII 1982.","IX 1982.","X 1982.","XI 1982.","XII 1982.","I 1983.","II 1983.","III 1983.","IV 1983.","V 1983.","VI 1983.","VII 1983.","VIII 1983.","IX 1983.","X 1983.","XI 1983.","XII 1983.","I 1984.","II 1984.","III 1984.","IV 1984.","V 1984.","VI 1984.","VII 1984.","VIII 1984.","IX 1984.","X 1984.","XI 1984.","XII 1984.","I 1985.","II 1985.","III 1985.","IV 1985.","V 1985.","VI 1985.","VII 1985.","VIII 1985.","IX 1985.","X 1985.","XI 1985.","XII 1985.","I 1986.","II 1986.","III 1986.","IV 1986.","V 1986.","VI 1986.","VII 1986.","VIII 1986.","IX 1986.","X 1986.","XI 1986.","XII 1986.","I 1987.","II 1987.","III 1987.","IV 1987.","V 1987.","VI 1987.","VII 1987.","VIII 1987.","IX 1987.","X 1987.","XI 1987.","XII 1987.","I 1988.","II 1988.","III 1988.","IV 1988.","V 1988.","VI 1988.","VII 1988.","VIII 1988.","IX 1988.","X 1988.","XI 1988.","XII 1988.","I 1989.","II 1989.","III 1989.","IV 1989.","V 1989.","VI 1989.","VII 1989.","VIII 1989.","IX 1989.","X 1989.","XI 1989.","XII 1989.","I 1990.","II 1990.","III 1990.","IV 1990.","V 1990.","VI 1990.","VII 1990.","VIII 1990.","IX 1990.","X 1990.","XI 1990.","XII 1990.","I 1991.","II 1991.","III 1991.","IV 1991.","V 1991.","VI 1991.","VII 1991.","VIII 1991.","IX 1991.","X 1991.","XI 1991.","XII 1991.","I 1992.","II 1992.","III 1992.","IV 1992.","V 1992.","VI 1992.","VII 1992.","VIII 1992.","IX 1992.","X 1992.","XI 1992.","XII 1992.","I 1993.","II 1993.","III 1993.","IV 1993.","V 1993.","VI 1993.","VII 1993.","VIII 1993.","IX 1993.","X 1993.","XI 1993.","XII 1993.","I 1994.","II 1994.","III 1994.","IV 1994.","V 1994.","VI 1994.","VII 1994.","VIII 1994.","IX 1994.","X 1994.","XI 1994.","XII 1994.","I 1995.","II 1995.","III 1995.","IV 1995.","V 1995.","VI 1995.","VII 1995.","VIII 1995.","IX 1995.","X 1995.","XI 1995.","XII 1995.","I 1996.","II 1996.","III 1996.","IV 1996.","V 1996.","VI 1996.","VII 1996.","VIII 1996.","IX 1996.","X 1996.","XI 1996.","XII 1996.","I 1997.","II 1997.","III 1997.","IV 1997.","V 1997.","VI 1997.","VII 1997.","VIII 1997.","IX 1997.","X 1997.","XI 1997.","XII 1997.","I 1998.","II 1998.","III 1998.","IV 1998.","V 1998.","VI 1998.","VII 1998.","VIII 1998.","IX 1998.","X 1998.","XI 1998.","XII 1998.","I 1999.","II 1999.","III 1999.","IV 1999.","V 1999.","VI 1999.","VII 1999.","VIII 1999.","VI 2008.","X 1999.","X 1999.","XI 1999.","XII 1999.","I 2000.","II 2000.","III 2000.","IV 2000.","V 2000.","VI 2000.","VII 2000.","VII 2000.","VIII 2000.","VIII 2000.","IX 2000.","X 2000.","XI 2000.","XII 2000.","I 2001.","II 2001.","III 2001.","IV 2001.","V 2001.","VI 2001.","VII 2001.","VIII 2001.","VIII 2001.","IX 2001.","IX 2001.","X 2001.","XI 2001.","XII 2001.","I 2002.","II 2002.","III 2002.","IV 2002.","V 2002.","VI 2002.","VII 2002.","VIII 2002.","IX 2002.","X 2002.","XI 2002.","XII 2002.","I 2003.","II 2003.","III 2003.","IV 2003.","V 2003.","VI 2003.","VII 2003.","VIII 2003.","IX 2003.","X 2003.","XI 2003.","XII 2003.","I 2004.","II 2004.","III 2004.","IV 2004.","V 2004.","VI 2004.","VII 2004.","VIII 2004.","IX 2004.","X 2004.","XI 2004.","XII 2004.","I 2005.","II 2005.","III 2005.","IV 2005.","V 2005.","VI 2005.","VII 2005.","VIII 2005.","IX 2005.","X 2005.","XI 2005.","XII 2005.","I 2006.","II 2006.","III 2006.","IV 2006.","V 2006.","VI 2006.","VII 2006.","VIII 2006.","IX 2006.","X 2006.","XI 2006.","XII 2006.","I 2007.","II 2007.","III 2007.","IV 2007.","V 2007.","VI 2007.","VII 2007.","VIII 2007.","IX 2007.","X 2007.","XI 2007.","XII 2007.","I 2008.","II 2008.","III 2008.","IV 2008.","V 2008.","VI 2008.","VII 2008.","VIII 2008.","IX 2008.","X 2008.","XI 2008.","XII 2008.","I 2009.","II 2009.","III 2009.","IV 2009.","V 2009.","VI 2009.","VII 2009.","VIII 2009.","IX 2009.","X 2009.","XI 2009.","XII 2009.","I 2010.","II 2010.","III 2010.","IV 2010.","V 2010.","VI 2010.","VII 2010.","VIII 2010.","IX 2010.","X 2010.","XI 2010.","XII 2010.","I 2011.","II 2011.","III 2011.","IV 2011.","V 2011.","VI 2011.","VII 2011.","VIII 2011.","IX 2011.","X 2011.","XI 2011.","XII 2011.","I 2012.","II 2012.","III 2012.","IV 2012.","V 2012.","VI 2012.","VII 2012.","VIII 2012.","VIII 2012.","IX 2012.","X 2012.","XI 2012.","XII 2012.","I 2013.","II 2013.","III 2013.","IV 2013.","V 2013.","VI 2013.","VII 2013.","VIII 2013.","","","","","","","","","","","","","","",""
    ]
    
    // for a in $(cat app/src/alanFord/assets/numbers | gunzip - ); do echo -n \"${a}\":; cat app/src/alanFord/assets/$a | gunzip - | wc -l; done | tr '\n' ','
    private static let nposPage_alanFord: [String:Int] = ["1":121,"2":121,"3":121,"4":121,"5":121,"6":121,"7":121,"8":121,"9":121,"10":121,"11":121,"12":121,"13":121,"14":121,"15":121,"16":121,"17":121,"18":121,"19":121,"20":121,"21":121,"22":121,"23":121,"24":121,"25":121,"26":121,"27":121,"28":121,"29":121,"30":121,"31":121,"32":121,"33":121,"34":121,"35":121,"36":121,"37":121,"38":121,"39":121,"40":121,"41":121,"42":121,"43":121,"44":121,"45":121,"46":121,"47":121,"48":121,"49":121,"50":121,"51":121,"52":121,"53":121,"54":121,"55":121,"56":121,"57":121,"58":121,"59":121,"60":121,"61":121,"62":121,"63":121,"64":121,"65":121,"66":120,"67":121,"68":121,"69":121,"70":121,"71":121,"72":121,"73":121,"74":121,"75":121,"76":121,"77":121,"78":121,"79":121,"80":121,"81":121,"82":121,"83":121,"84":121,"85":121,"86":121,"87":121,"88":121,"89":121,"90":121,"91":121,"92":121,"93":121,"94":121,"95":121,"96":121,"97":121,"98":121,"99":121,"100":121,"101":121,"102":121,"103":121,"104":121,"105":121,"106":121,"107":121,"108":121,"109":121,"110":121,"111":121,"112":121,"113":121,"114":121,"115":121,"116":121,"117":121,"118":121,"119":121,"120":121,"121":121,"122":121,"123":121,"124":121,"125":121,"126":121,"127":121,"128":121,"129":121,"130":121,"131":121,"132":121,"133":121,"134":121,"135":121,"136":121,"137":121,"138":121,"139":121,"140":121,"141":121,"142":121,"143":121,"144":121,"145":121,"146":121,"147":121,"148":121,"149":121,"150":117,"151":121,"152":121,"153":121,"154":121,"155":121,"156":121,"157":121,"158":121,"159":121,"160":121,"161":121,"162":121,"163":121,"164":121,"165":121,"166":121,"167":121,"168":121,"169":121,"170":121,"171":121,"172":121,"173":121,"174":121,"175":121,"176":121,"177":121,"178":121,"179":121,"180":121,"181":121,"182":121,"183":121,"184":121,"185":121,"186":121,"187":121,"188":121,"189":121,"190":121,"191":121,"192":121,"193":121,"194":121,"195":121,"196":121,"197":121,"198":121,"199":121,"200":123,"201":121,"202":121,"203":121,"204":121,"205":121,"206":121,"207":121,"208":121,"209":121,"210":121,"211":121,"212":121,"213":121,"214":121,"215":121,"216":121,"217":121,"218":121,"219":121,"220":121,"221":121,"222":121,"223":121,"224":121,"225":121,"226":121,"227":121,"228":121,"229":121,"230":121,"231":121,"232":121,"233":121,"234":121,"235":121,"236":121,"237":121,"238":121,"239":121,"240":121,"241":121,"242":121,"243":121,"244":121,"245":121,"246":121,"247":121,"248":121,"249":121,"250":125,"251":121,"252":121,"253":121,"254":121,"255":121,"256":121,"257":121,"258":121,"259":121,"260":121,"261":121,"262":121,"263":121,"264":121,"265":121,"266":121,"267":121,"268":121,"269":121,"270":121,"271":121,"272":121,"273":121,"274":121,"275":121,"276":121,"277":121,"278":121,"279":121,"280":121,"281":121,"282":121,"283":121,"284":121,"285":121,"286":121,"287":121,"288":121,"289":121,"290":121,"291":121,"292":121,"293":121,"294":121,"295":121,"296":121,"297":121,"298":121,"299":121,"300":121,"301":121,"302":121,"303":121,"304":121,"305":121,"306":121,"307":121,"308":121,"309":121,"310":121,"311":121,"312":121,"313":121,"314":121,"315":121,"316":121,"317":121,"318":121,"319":121,"320":121,"321":121,"322":121,"323":121,"324":121,"325":121,"326":121,"327":121,"328":121,"329":121,"330":121,"331":121,"332":121,"333":121,"334":121,"335":121,"336":121,"337":121,"338":121,"339":121,"340":121,"341":121,"342":121,"343":121,"344":121,"345":121,"346":121,"347":121,"348":121,"349":121,"350":121,"351":121,"352":121,"353":121,"354":121,"355":121,"356":121,"357":121,"358":121,"359":121,"360":121,"361":121,"362a":121,"362b":121,"363":121,"364":121,"365":121,"366":121,"367":121,"368":120,"369":121,"370":121,"371":121,"372":121,"373a":121,"373b":121,"374a":121,"374b":121,"375":121,"376":121,"377":121,"378":121,"379":121,"380":121,"381":121,"382":121,"383":121,"384":121,"385":121,"386a":121,"386b":121,"387a":121,"387b":121,"388":121,"389":121,"390":121,"391":121,"392":121,"393":121,"394":121,"395":121,"396":121,"397":121,"398":121,"399":121,"400":121,"401":121,"402":121,"403":121,"404":121,"405":121,"406":121,"407":121,"408":121,"409":121,"410":121,"411":121,"412":121,"413":121,"414":121,"415":121,"416":121,"417":121,"418":121,"419":121,"420":121,"421":121,"422":121,"423":121,"424":121,"425":121,"426":121,"427":121,"428":121,"429":121,"430":121,"431":121,"432":121,"433":121,"434":121,"435":121,"436":121,"437":121,"438":121,"439":123,"440":121,"441":121,"442":121,"443":121,"444":121,"445":121,"446":121,"447":121,"448":121,"449":121,"450":121,"451":126,"452":121,"453":121,"454":121,"455":121,"456":121,"457":121,"458":121,"459":121,"460":121,"461":121,"462":121,"463":121,"464":121,"465":121,"466":121,"467":121,"468":121,"469":121,"470":121,"471":121,"472":121,"473":121,"474":121,"475":121,"476":121,"477":123,"478":121,"479":121,"480":121,"481":121,"482":125,"483":121,"484":121,"485":127,"486":121,"487":121,"488":121,"489":121,"490":121,"491":121,"492":121,"493":121,"494":121,"495":121,"496":121,"497":121,"498":121,"499":121,"500":255,"501":121,"502":121,"503":121,"504":121,"505":121,"506":123,"507":121,"508":121,"509":121,"510":128,"511":121,"512":121,"513":121,"514":121,"515":121,"516":121,"517":48,"518a":59,"518b":50,"519":121,"520":121,"521":121,"522":121,"523":121,"524":121,"525":121,"526":121,"527":121,"528":121,"529":121,"530":121,"S01":17,"S02":121,"S03":121,"S04":116,"S05":121,"S06":121,"S07":121,"S08":121,"S09":121,"S10":121,"S11":121,"S12":122,"S13":122,"S14":122,"S15":122]
    
    // cat app/src/alanFord/assets/numbers | gunzip - | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    private static let numbers_druzinaOdVjesala: [String] = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20"]

    // cat app/src/alanFord/assets/titles | gunzip - | tr '"' "'" | sed -r 's/$/"/' | sed -r 's/^/"/' | tr -d '\r' | tr '\n' ','
    private static let titles_druzinaOdVjesala: [String] = ["Obješenjaci","Kastelan Kobac","Otmica Analize","Kraljevstvo od Ljepovida","Turnir turnira","Povratak Leoparda","Sedmorica mudroglavih","Morska mačka","Crnorižac","Emir od Suharka","Kraljevski slastičar","Prokleta plovidba","Robovi Punisa","Leteći sag","Doktor Nadir","Ruža nesloge","Sijamski duhovi","Plamena ljepotica","Početak kraja","Završni račun"]
    
    private static let dates_druzinaOdVjesala: [String] = ["","","","","","","","","","","","","","","","","","","",""]
    
    // for a in $(cat app/src/alanFord/assets/numbers | gunzip - ); do echo -n \"${a}\":; cat app/src/alanFord/assets/$a | gunzip - | wc -l; done | tr '\n' ','
    private static let nposPage_druzinaOdVjesala: [String:Int] = ["01":126,"02":124,"03":124,"04":122,"05":115,"06":124,"07":121,"08":124,"09":124,"10":123,"11":123,"12":124,"13":124,"14":124,"15":124,"16":123,"17":123,"18":123,"19":123,"20":123]

    // =====otkriceSveta=====
    private static let numbers_otkriceSveta: [String] = ["001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020",]
    private static let titles_otkriceSveta: [String] = ["Odisej i Aleksandar veliki","Pustolovina Vikinga","Marko Polo","Kristofor Kolumbo","Vasko de Gama","Kortes i zlato Asteka","Pisaro kod Inka","Pijani brod na Amazonu","Magelan na putu oko sveta","Kartije u Kanadi","Niz Misisipi","Gusar Drejk","Pravac Australija","Kapetan Kuk","Pobuna na brodu Baunti","Priviđenje Tombuktua","Livingston i Stenli u srcu Afrike","Na izvorima Nila","Gvozdeni konj","Darvin na Galapagosima",]
    private static let dates_otkriceSveta: [String] = ["","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_otkriceSveta: [String:Int] = [ "001":51,"002":52,"003":51,"004":51,"005":51,"006":51,"007":51,"008":51,"009":51,"010":51,"011":51,"012":52,"013":52,"014":51,"015":51,"016":51,"017":51,"018":51,"019":51,"020":51,]
    // =====strip82=====
    private static let numbers_strip82: [String] = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","85","86","87","88","89","90","91","92","93","94","95",]
    private static let titles_strip82: [String] = ["Rip Kirbi","Modesti Blejz","Fantom","Poručnik Bluberi","Poručnik Bluberi","Džoni Hazard","Kazar","Iznogud","Džim iz džungle","Džejms Bond","Den Kuper","Kazar","Sin Sunca","Kapetan Vuk","Modesti Blejz","Kazar","Rip Kirbi","Kapetan Vuk","Zvezdane staze","Dazler","Drakuleta","Džejms Bond","Poručnik Bluberi","Mišel Vajan","Žena pauk","Fantom","Koko Bil","Iznogud","Žena pauk","Džim iz džungla","Rip Kirbi","Kockar","Modesti Blejz","Modesti Blejz","Drakuleta","Mek Koj","Džejms Bond","Iznogud","Zvezdane staze","Drakuleta","Ši-Kaj","Fantom","Rip Kirbi","Artur, nestašni duh","Džejms Bond","Dazler","Modesti Blejz","Modesti Blejz","Legenda o Mek Koju","Drakuleta","Ši-Kaj","Dazler","Iznogud","Bitka kod Foklanda","Modesti Blejz","Franvalovi","Džim iz džungle","Zvezdane staze","Ted i Tedi","Mišel Vajan","Artur, nestašni duh","Bitka za Midvej","Fantom","Pesak Ivo Džime","Ši-Kaj","Rip Kirbi","Džim iz džungle","Mišel Vajan","Iznogud","Dazler","Poslednja poruka","Zvezdane staze","Mrtvi grad","Modesti Blejz","Ši-Kaj","Izgubljeni grad","Modesti Blejz","Tunga","Zvezdane staze","Tora Tora","Ben Bolt","Iznogud","Fantom","Kralj šume","Ves Slejd","Zvezdane staze","Artur, nestašni duh","Princeza svetlosti","Kapetan Apač - Veliki duh","Žena pauk - Novo poznanstvo","Ši-Kaj - U pravi čas","Fantom - U potrazi za mužem","Senke",]
    private static let dates_strip82: [String] = ["27. 05. 1981","03. 06. 1981","10. 06. 1981","17. 06. 1981","24. 06. 1981","01. 07. 1981","08. 07. 1981","15. 07. 1981","22. 07. 1981","29. 07. 1981","05. 08. 1981","12. 08. 1981","19. 08. 1981","26. 08. 1981","02. 09. 1981","09. 09. 1981","16. 09. 1981","23. 09. 1981","07. 10. 1981","14. 10. 1981","21. 10. 1981","28. 10. 1981","04. 11. 1981","11. 11. 1981","18. 11. 1981","25. 11. 1981","02. 12. 1981","09. 12. 1981","16. 12. 1981","23. 12. 1981","30. 12. 1981","06. 01. 1982","13. 01. 1982","20. 01. 1982","27. 01. 1982","03. 02. 1982","10. 02. 1982","17. 02. 1982","24. 02. 1982","03. 03. 1982","10. 03. 1982","17. 03. 1982","24. 03. 1982","31. 03. 1982","07. 04. 1982","14. 04. 1982","21. 04. 1982","28. 04. 1982","05. 05. 1982","12. 05. 1982","19. 05. 1982","26. 05. 1982","02. 06. 1982","09. 06. 1982","16. 06. 1982","23. 06. 1982","30. 06. 1982","07. 07. 1982","14. 07. 1982","21. 07. 1982","28. 07. 1982","04. 08. 1982","11. 08. 1982","18. 08. 1982","25. 08. 1982","01. 09. 1982","08. 09. 1982","15. 09. 1982","22. 09. 1982","29. 09. 1982","06. 10. 1982","13. 10. 1982","20. 10. 1982","27. 10. 1982","03. 11. 1982","10. 11. 1982","17. 11. 1982","24. 11. 1982","01. 12. 1982","08. 12. 1982","15. 12. 1982","22. 12. 1982","05. 01. 1983","12. 01. 1983","19. 01. 1983","26. 01. 1983","02. 02. 1983","09. 02. 1983","16. 02. 1983","23. 02. 1983","02. 03. 1983","09. 03. 1983","16. 03. 1983",]
    private static let nposPage_strip82: [String:Int] = [ "01":63,"02":61,"03":62,"04":62,"05":66,"06":66,"07":67,"08":66,"09":69,"10":65,"11":57,"12":67,"13":60,"14":64,"15":58,"16":62,"17":65,"18":64,"20":64,"21":66,"22":59,"23":64,"24":64,"25":67,"26":66,"27":66,"28":64,"29":63,"30":59,"31":65,"32":65,"33":64,"34":63,"35":63,"36":63,"37":61,"38":61,"39":63,"40":62,"41":65,"42":63,"43":63,"44":63,"45":62,"46":64,"47":46,"48":46,"49":47,"50":46,"51":46,"52":46,"53":45,"54":46,"55":43,"56":46,"57":48,"58":33,"59":45,"60":47,"61":47,"62":46,"63":46,"64":47,"65":46,"66":47,"67":30,"68":32,"69":32,"70":32,"71":32,"72":32,"73":31,"74":32,"75":32,"76":32,"77":30,"78":32,"79":30,"80":32,"81":31,"82":32,"83":32,"85":32,"86":32,"87":32,"88":31,"89":32,"90":31,"91":32,"92":32,"93":32,"94":31,"95":32,]
    // =====zagor=====
    private static let numbers_zagor: [String] = ["001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","040","041","042","045","046","047","048","049","050","051","052","053","054","055","056","057","058","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080","081","082","083","084","085","086","087","088","089","092","093","096","097","098","099","100","101","102","103","107","108","109","110","111","112","113","114","115","116","117","118","119","120","123","124","125","126","127","128","129","130","133","136","139","142","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","344","345","346","347","348","349","350","351","352","353","354","355","356","357","358","359","360","361","362","363","364","365","366","367","368","369","370","371","372","373","374","375","376","377","378","379","380","381","382","383","384","385","386","387","388","389","390","391","392","393","394","395","396","397","398","399","400","401","402","403","404","405","406","407","408","409","410","411","412","413","414","415","416","417","418","419","420","421","422","423","424","425","426","427","428","429","430","431","432","433","434","435","436","437","438","439","440","441","442","443","444","445","446","447","448","449","450","451","452","453","454","455","456","457","458","459","460","461","462","463","464","465","466","467","468","469","470","471","472","473","474","475","476","477","478","479","480","481","482","483","484","485","486","487","488","489","490","491","492","493","494","495","496","497","498","499","500","501","502","503","504","505","506","507","508","509","510","511","512","513","514","515","516","517","518","519","520","521","522","523","524","525","526","527","528","529","530","531","532","533","534","535","536","537","538","539","540","541","542","543","544","545","546","547","548","549","550","551","552","553","554","555","556","557","558","559","560","561","562","563","564","565","566","567","568","569","570","571","572","573","574","575","576","577","578","579","580","581","582","583","584","585","586","589","590","591","592","593","594","595","596","597","598","599","600","601","602","603","604","605","606","607","608","609","610","611","612","613","614","615","616","617","618","619","620","621","622","623","624","625","626","627","628","629","630","631","632","633","634","635","636","637","638","639","640","641","642","643","644","645","646","647","648","649","650",]
    private static let titles_zagor: [String] = ["Močvara Mo-Hi-La","Otrovni totem","Čovek koji leti","Ratnik Foksa","Zagor protiv Zagora","Slomljeno koplje","Tajanstveni pothvat","Robovi rudnika","Vodopad belog konja","Carstvo crne Jaske","Demoni iz šume","Tajna jezera Iri","Beli jelen Irokeza","Vrač Vabaši","Tajna mlina","Lažni markiz","Okrutni Runok","Specijalna misija","Zlatni mač","Žuta sekira","Ruka pomirenja","Žive mumije","Ubica iz mraka","Morske hijene","Bomba profesora Veribada","Neprijatelj iz sjene","Zagor u napadu","Klark siti","Lovci na ljude","Ljudska lovina","Nasilje u Darkvudu","Bjegunac","Kuća užasa","Igra pet strela","Čelična neman","Zarobljenici 'Crvene veštice'","Satko","Dečko pik","Krvava cesta","Zvijeri","Vukodlak","Skriveni grad","Put do smaragda","Stari sat","Čovek u crnom","Novogodišnja noć","Zagor priča","Gospodar Darkvuda","Jack Mohikanac","Cena života","Izazov kitolovcima","Okršaj sa Vikinzima","Piratski brod","Gospodar reke","Car orlova","Poslednji let","Plava zvezda","Gvozdena pesnica","Smrtonosna Tumaka","Skrovište šakala","Zlatna kapija","Metalna zvezda","Sultanova ruka","Crni šeik","Sablasna noć","Snežni soskolovi","Beli ris","Neočekivana poseta","Idol Vijandota","Čelična kuća","Bela maska","Indijanski cirkus","Tjeskoba","Zagor protiv vampira","Tragična zora","Zagorova odiseja","Opasne vode","Do poslednjeg daha","Oluja nad Haitijem","Tajanstveno krstarenje","Na dnu okeana","Zlato Inka","Kapetan Zmija","Džimi gitara","Karneval","Zakon viteštva","Zaverenici","Povratak u Darkvud","Osinje gnezdo","Bleštavi trag","Crna močvara","Podvodno čudovište","Zimska zmija","Poruke smrti","Marš očajnika","Preživeli","Poslednja žrtva","Stižu samuraji","Sekira i sablja","Gnev Osaga","Trenuci zebnje","Avanturista","Izazov","Sedma runda","Došljaci sa Aljaske","Zagorov ponos","Kraj tiranina","Meklaudov karavan","Kandraksova mumija","Vanatina zamka","Lov iznenađenja","Tajanstveni jahač","Tropska šuma","Mađioničar Saliven","Zagorova pravda","Ulovljeni lovac","Zelena opasnost","Vatreno iskušenje","Neravna borba","Zagonetna formula","Blindirana soba","Ostrvo magle","Zagor-Te-Nej","Odred straha","Veliki skok","Naivčine iz Elkinsa","Požar u Norfolku","Zlatni pečat","Zagor protiv Vonga","Tvrđava na moru","Eksploziv A-Z 119","Sedmorica neustrašivih","Izvidnica straha","Obračun kod Big Beja","Lavlje srce","Tajni eksperimenti","Nestalo pleme","Krilati osvetnik","Kobna avantura","Džinovski kraken","Poslednji Viking","Čiko pecaroš","Demoni u reci","Put u nepoznato","Sijera Blanka","Džimi gitara se vraća","Crvena orhideja","Ikarovo pero","Smrtonosni zrak","Teror šeste planete","Svemirska tamnica","Zagor izazivač","Meč stoleća","Senka smrti","Noć užasa","Zagor protiv barona","Noć demona","Raskrinkani vampir","Pećina čudovišta","Klopka za Zagora","Ludi Hakaram","Otrovna strela","Plamena lobanja","Na krilima noći","Horde zla","Usijana stena","Vuk samotnjak","Pobeda vuka samotnjaka","Prokleto blago","Demonska maska","Slomljeno koplje","Bledoliki otpadnik","Velika protuva","Kobna mreža","Crna kula","Velika urota","U kandžama zla","Na ivici ponora","Paklena jazbina","Troglava aždaja","Tvrdokrilac","Jednooki Džek","Obračun","Ubica iz Darkvuda","Senka sumnje","Rendal mutant","Velika pljačka","Zlatna udica","Poglavica žute kose","Timber Bil","Utvara u noći","Prognani iz Darkvuda","Ratnici Manomeji","Glasnik Manitua","Povratak Supermajka","Sablasni voz","Provala","Lanac saučesnika","Gavranova pera","Nevidljivi osvetnik","Brodolom na Misuriju","Žrtva Ki-noah","Srebrni vodopad","Žig srama","Pećina mumija","Dvojnik","Gvozdena stupica","Pakao na granici","Veribedovo oružje","Rečna patrola","Put straha","Nepoznati svet","Bubnjevi smrti","Kameni pakao","Zagorov zakon","Ratni poklič","Sovina litica","Magične oči","Moćni Kandraks","Sablasti iz tvrđave","Paklena sprava","Mrtvački ples","Pleme Sauka","Zaseda za Zagora","Vatrena voda","Ratnik Pekot","Tajna na mapi","Koliba smrti","Neumoljivi Zagor","Dani straha","Gospodar vremena","Kameni ubica","Mračna slutnja","Smrtonosna potraga","Pljačkaši đavolje doline","Crni mesec","Voz smrti","Osveta crne ruke","Lovci na blago","Zmajevo grotlo","Jeti","Tajna sedam moći","Lov na čoveka","Demoni ludila","Invazija Akronijana","Na granici stvarnog","Helingenov povratak","U šakama robijaša","Lovci na ucene","Zver iz Valoka","Tonkino prokletstvo","Oteti dečak","Ugašarov ultimatum","Obeležena žrtva","Pleme drvenih lica","Sveti breg","Zakon predaka","Hiljadu lica straha","Zeleno blato","Ljudi žabe","Opsada tvrđave Iri","Pećina vetrova","Banda staklenog oka","Između dve vatre","Prorokov sin","Spasilac Onondaga","Utrka sa sedam strelica","Mrtvačka glava","Pobuna","Divlje staze","Graničari","Svadbeni nakit","Slepilo","Zagor na nišanu","Zlokobno predskazanje","Potop u Darkvudu","Dijabralova sudbina","Čiko zavodnik","Sindrom belzebul","Pretnja nad Blek riverom","Povlačenje","Fatalna žena","Vuk Kaplan","Rečna avet","Kapetanova tajna","Tajanstveni samostan","Živi pokopani","Sveto drvo","Priznanje","Dan otkupa","Indijanska krv","Zatrovani tomahavk","Prokleto zlato","Indijansko groblje","Omča","Tragedija u Silver townu","Izdajnik","Ljudi i zvijeri","Sramotan sporazum","Željezni narednik","Noć krvoprolića","Kradljivac sjena","Čovjek s puškom","Bijela srdžba","Smrt u ledu","Sotonski izum","Nemoguća dimenzija","Bijela indijanka","Falsifikatori","Osvajači","Alhemičareva senka","Izgubljeni istraživač","Severozapadni prolaz","Arktička sfinga","Pobunjenici","Aljaska","Ratnici gromovnika","Zmajevi gusari","Otok guvbavaca","Razbojnici","Okršaj u Los Anđelesu","Konkvistadori","Sedam gradova Cibole","Tajna Anasaza","Vještica iz Sierre","Dimni signali","Krv Apača","Pomahnitali divljak","Komanči","Teksaški rendžeri","Izgubljeni rudnik","Svratište obješenih","Osveta vudu","Laguna živih mrtvaca","Liberty Sam","Brod trgovaca robljem","Strah nad rijekom","Oštrica u sjeni","Indijanska zemlja","Lažna optužba","Izgubljeni sin","Imanje pod opsadom","Sjene nad Darkwoodom","Specijalni agent","Hellingen je živ","Dvoboj u svemiru","Tajna Redstonea","Opsjednutost","Obojeni čovjek","Vatrena ptica","Divlja djevojka","Nasljedstvo Fitzmayerovih","Morska strava","Lovac na vještice","Kraken!","Otočka skupina","Kapetan Midnight","Povratak Nata Murda","Tajna jednoroga","Grenland","Fatalno oružje","Sotonski Mortimer","Majstorski udarac","Vampir","Tajna Fride Lang","Princ noći","Dugin most","Strah na visokoj Sierri","Golgota","Smrtonosni bljesak","Dvoboj u sumrak","Plaćenici","Prokleta dolina","Mortimerova osveta","Šah-mat","Istrebljivači","Metak za Kelsa","Braća po krvi","Teritorija Komanča","Pod Meksičkom zastavom","Izazov u brdima Vičite","Bekstvo u slobodu","U lancima","Blago Žana Lafita","Zaljevski gusari","Odredište Afrika","Kainov povratak","Atlantida","Skrivena utvrda","Kraljica mrtvoga grada","Carstvo Songhaya","Zemlja slobode","Ratnice iz savane","Verakruz","Streljački vod","Crni brod","Božica mjeseca","Povratak Kandraxa","Krvna žrtva","Junaci crvene grane","Otok sjena","Vječni rat","Demonska knjiga","Ključevi pakla","Delaware","Zlato braće Ward","Sjeme nasilja","Posljednja strelica","Brodolomci","Kuća na hridinama","Thugsi","Prošlost fakira Ramatha","Amajlija od žada","Tajanstveni izvor","Narod s jezera","Zeleni rubac","Strava u tami","Pratnja Mohawka","Vražji labirint","Kukci ubojice","Stroj smrti","Traperska izvidnica","Maska na licu","Vatra s neba","Prijetnja iz svemira","Paukova mreža","Mortimerov povratak","Zagor protiv Krojača","Presuda po kratkom postupku","Crveni snijeg","Lavina","Močvara robijaša","Tragičan bijeg","Južne vode","Otok zmija","Tajna Sumera","Teror u muzeju","Zamke i otrovi","Misteriozno selo","Mračne sile","Podzemlje Nju Orleansa","Na tragu neprijatelja","U džungli Jukatana","Grad u močvari","Krvave piramide","Poslednja tula","Silazak u Maelstrom","Razbojnici iz skrivene doline","Tron bogova","Lord u Darkvudu","Ljudi sa granice","Čovek koji je došao sa Istoka","Srce i mač","Vreme osvete","Tamo gde protiče reka","Traperi iz Fort Eroua","Hjuroni!","Banda Razrokog","Juriš Mohava","Misisipi","Blindirani vagon","Pljačkaši","Povratak mutanta","Vojna pratnja","Vatrena klopka","Čovek sa dva mozga","Indijanska magija","Misteriozna dolina","Kraljevstvo straha","Mrtva šuma","Ratnici noći","Tajna talismana","Indijanci iz prerije","Neistražene zemlje","Odložena smrt","Kameni div","Rečni vukovi","Cena izdaje","Paklena horda","Na ivici vulkana","Krv Mohavka","Napušteni rudnik","Bez milosti","Okrutni Havak","Do poslednjeg daha","Znak zla","Gospodar tame","Plezent Point","Severni povratnik","Zagor protiv Mortimera","Gusarska pećina","Crna krila noći","Vampirica Ilenija","Krijumčari iz lagune","Omča za Gambit","Kauboji","Zaustavite dželata","Divlja zemlja","Tamo gde lešinari lete","Senke u šumi","Pun mesec","Tama boje krvi","Ljudi i vukovi","U potrazi za Zagorom","Ujed zmije","Smrtonosni izazov","Povratak Diging Bila","Žute senke","Crno ogledalo","Sahranjeni užas","Planine strave","Ljudi izvan zakona","Selo bezumlja","Veliki turnir","Poslednja borba","Ponekad se vraćaju","Izdanci zla","Manituov kovčeg","Skiptar Tin Hinan","Kušitski nekromanti","Bog praha","Dvoboj na okeanu","Zaliv aligatora","U kraljevstvu Kadžuna","Beskrajna noć","Na putu za Panamu","Put zlata","Pacifik!","Mumija sa Anda","Na tragu Dekstera Grina","Kusko","Grad na Kordiljerima","Zeleni lavirint","Na obali velike reke","Žene ratnice","Pirane","Krv nad Baijom","Vetar pobune","Vojska ludaka","Sertao","Pobuna Kangasairosa","Iščezli svet","Okršaj titana","Most nad provalijom","Proročanstvo","Sudnji dan","Pod nebom juga","Kamena šuma","Vreme sudbine","Ognjena zemlja","Izvan granica sveta","Borba za život","Antarktik","Gospodar ostrva","Povratak kući","Krvana osveta","Požar na Golden Bejbi","Mortimer: Poslednji čin","Pobuna","Helgeht u plamenu!","Očajnička trka","Kaufmanov zoološki vrt","Tvrđava na litici","Bubnjevi u noći","Dan invazije","Nasleđe Helingena","Vaskrsenje","U podzemlju baze drugde","Ludi doktor","Završna igra","Monstrum iz Filadelfije","Povratak Crnih vukova","Senka faraona","Blago piramide","Pustinjski zarobljenici","Gospodari","Vatra nad Merivelom","Neljudi","Ubice iz svemira","Zenit 666","Vampiri!","U potrazi za Rakošijem","Husari smrti","Njufaudlend!","Na ledenom severu","Krik Banši","Kromov glasnik","Povratak samuraja","Zaseda nindži","Crveno sunce","Pipci!","Sedl Taun","Smirnofova osveta","Rat špijuna","Ubijte lorda Malkolma","Povratak Blondi","Banda nemilosrdnih","Izabelina prošlost","Slepi bes","Kamen koji gori","Tandermenovo ludilo","Odmetnici","Senke nad 'Golden bejbi'","Ljudi zmije","Hram hiljadu smrti","Crne suze","Dolina spomenika","Pustinjska ekspedicija","Misteriozni Pueblo","Vatreni fetiš","Kromove sluge","Ritualna žrtva","Misterija na brdu Natani","Sledbenici","Helingenova sudbina",]
    private static let dates_zagor: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_zagor: [String:Int] = [ "001":100,"002":52,"003":78,"004":95,"005":98,"006":95,"007":97,"008":75,"009":95,"010":97,"011":95,"012":123,"013":77,"014":97,"015":98,"016":98,"017":68,"018":66,"019":75,"020":98,"021":124,"022":112,"023":74,"024":163,"025":77,"026":99,"027":99,"028":83,"029":99,"030":99,"031":129,"032":99,"033":118,"040":83,"041":134,"042":191,"045":97,"046":97,"047":97,"048":97,"049":98,"050":158,"051":81,"052":82,"053":121,"054":53,"055":97,"056":67,"057":98,"058":136,"063":97,"064":95,"065":96,"066":89,"067":87,"068":93,"069":139,"070":92,"071":94,"072":112,"073":79,"074":86,"075":77,"076":72,"077":138,"078":85,"079":84,"080":110,"081":112,"082":97,"083":97,"084":97,"085":97,"086":97,"087":28,"088":108,"089":110,"092":135,"093":121,"096":115,"097":127,"098":97,"099":113,"100":127,"101":97,"102":93,"103":97,"107":97,"108":93,"109":96,"110":105,"111":126,"112":80,"113":87,"114":87,"115":77,"116":78,"117":119,"118":120,"119":114,"120":117,"123":97,"124":96,"125":99,"126":106,"127":115,"128":121,"129":133,"130":115,"133":140,"136":101,"139":113,"142":127,"145":125,"146":111,"147":69,"148":70,"149":92,"150":95,"151":95,"152":99,"153":76,"154":81,"155":81,"156":81,"157":95,"158":86,"159":91,"160":88,"161":81,"162":85,"163":76,"164":76,"165":76,"166":73,"167":76,"168":130,"169":105,"170":93,"171":93,"172":83,"173":68,"174":81,"175":94,"176":94,"177":81,"178":80,"179":84,"180":81,"181":85,"182":93,"183":79,"184":79,"185":95,"186":95,"187":95,"188":92,"189":93,"190":78,"191":71,"192":92,"193":88,"194":77,"195":77,"196":75,"197":83,"198":83,"199":81,"200":97,"201":91,"202":90,"203":81,"204":91,"205":89,"206":90,"207":90,"208":84,"209":78,"210":85,"211":89,"212":82,"213":95,"214":95,"215":71,"216":80,"217":86,"218":87,"219":48,"220":79,"221":81,"222":79,"223":91,"224":44,"225":91,"226":90,"227":89,"228":90,"229":48,"230":91,"231":60,"232":89,"233":93,"234":93,"235":43,"236":95,"237":47,"238":80,"239":79,"240":46,"241":93,"242":90,"243":77,"244":93,"245":81,"246":95,"247":63,"248":72,"249":92,"250":94,"251":65,"252":93,"253":94,"254":87,"255":44,"256":95,"257":92,"258":91,"259":87,"260":89,"261":76,"262":92,"263":82,"264":90,"265":70,"266":91,"267":72,"268":93,"269":54,"270":81,"271":82,"272":93,"273":94,"274":92,"275":89,"276":98,"277":95,"278":93,"281":91,"282":55,"283":94,"284":76,"285":78,"286":78,"287":95,"288":94,"289":94,"290":95,"291":71,"292":95,"293":95,"294":94,"295":65,"296":75,"297":95,"298":95,"299":95,"300":95,"301":95,"302":95,"303":95,"304":53,"305":94,"306":94,"307":72,"308":93,"309":94,"310":88,"311":94,"312":62,"313":95,"314":95,"315":95,"316":48,"317":95,"318":57,"319":95,"320":95,"321":97,"322":51,"323":97,"324":98,"325":98,"326":98,"327":98,"328":95,"329":95,"330":95,"331":95,"332":95,"333":95,"334":95,"335":95,"336":95,"337":95,"338":95,"339":95,"340":127,"341":95,"342":95,"343":95,"344":95,"345":95,"346":95,"347":95,"348":95,"349":95,"350":95,"351":95,"352":95,"353":95,"354":95,"355":95,"356":95,"357":95,"358":95,"359":95,"360":95,"361":95,"362":95,"363":95,"364":95,"365":95,"366":95,"367":95,"368":95,"369":95,"370":95,"371":95,"372":95,"373":95,"374":95,"375":98,"376":95,"377":94,"378":95,"379":95,"380":95,"381":95,"382":95,"383":95,"384":95,"385":95,"386":95,"387":95,"388":95,"389":95,"390":97,"391":94,"392":95,"393":95,"394":95,"395":95,"396":95,"397":95,"398":95,"399":95,"400":95,"401":95,"402":95,"403":95,"404":95,"405":95,"406":95,"407":95,"408":95,"409":95,"410":95,"411":95,"412":95,"413":95,"414":95,"415":95,"416":95,"417":95,"418":95,"419":95,"420":95,"421":95,"422":95,"423":95,"424":95,"425":95,"426":95,"427":95,"428":95,"429":95,"430":95,"431":95,"432":95,"433":95,"434":95,"435":95,"436":95,"437":95,"438":95,"439":95,"440":95,"441":95,"442":95,"443":95,"444":95,"445":95,"446":95,"447":95,"448":95,"449":95,"450":95,"451":95,"452":95,"453":95,"454":95,"455":95,"456":95,"457":95,"458":95,"459":95,"460":95,"461":95,"462":95,"463":95,"464":95,"465":95,"466":95,"467":95,"468":95,"469":95,"470":95,"471":95,"472":95,"473":95,"474":95,"475":95,"476":95,"477":95,"478":99,"479":95,"480":95,"481":96,"482":95,"483":95,"484":95,"485":95,"486":95,"487":95,"488":95,"489":95,"490":95,"491":95,"492":95,"493":95,"494":95,"495":95,"496":95,"497":95,"498":95,"499":95,"500":95,"501":95,"502":95,"503":95,"504":95,"505":95,"506":95,"507":95,"508":95,"509":95,"510":95,"511":95,"512":95,"513":95,"514":95,"515":95,"516":95,"517":95,"518":95,"519":100,"520":95,"521":95,"522":95,"523":95,"524":95,"525":95,"526":95,"527":95,"528":95,"529":95,"530":95,"531":95,"532":95,"533":95,"534":95,"535":95,"536":95,"537":95,"538":96,"539":95,"540":95,"541":95,"542":95,"543":96,"544":95,"545":95,"546":95,"547":96,"548":96,"549":96,"550":96,"551":96,"552":96,"553":96,"554":96,"555":96,"556":96,"557":97,"558":100,"559":100,"560":100,"561":100,"562":99,"563":100,"564":99,"565":99,"566":100,"567":99,"568":99,"569":99,"570":100,"571":99,"572":100,"573":100,"574":100,"575":101,"576":106,"577":100,"578":100,"579":99,"580":100,"581":99,"582":99,"583":99,"584":99,"585":99,"586":99,"589":96,"590":96,"591":96,"592":96,"593":96,"594":95,"595":96,"596":96,"597":96,"598":96,"599":96,"600":96,"601":96,"602":96,"603":96,"604":96,"605":96,"606":96,"607":96,"608":96,"609":96,"610":96,"611":96,"612":96,"613":96,"614":96,"615":96,"616":96,"617":96,"618":96,"619":96,"620":96,"621":96,"622":96,"623":96,"624":96,"625":96,"626":95,"627":96,"628":96,"629":96,"630":96,"631":96,"632":96,"633":96,"634":96,"635":96,"636":96,"637":96,"638":96,"639":97,"640":96,"641":96,"642":96,"643":98,"644":96,"645":96,"646":96,"647":96,"648":96,"649":96,"650":96,]
    // =====nathanNever=====
    private static let numbers_nathanNever: [String] = ["000","001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","032","033","034","035","036","037","038","039","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080","081","082","083","084","085","086","087","088","089","090","091","092","093","094","095","096","097","098","099","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164",]
    private static let titles_nathanNever: [String] = ["Broj nula","Specijalni agent Alfe","Crni monolit","Operacija 'Zmaj'","Otok smrti","Nevidljiva sila","Strava isod nule","Zabranjena zona","Ljudi sjene","Oči neznanca","Pakao","Svemirsko pješaštvo","Posljednja bitka","Iza zvijezda","Izgorena zemlja","Pustinjski razbojnici","Prvak","Preživljavanje na nuli","U ponoru pamćenja","Jedanaesta zapovijed","Vrijeme osvete","Delirij","Demoni","Izgubljeni svijet","Zatočenica dvorca","Osvetnici","Vampirus","Srce tame","Ja, robot","Posljednji val","Gabrijelova zagonetka","Prljava ulica","Glas iz prošlosti","Bufalo ekspres","Mrtva zemlja","Opsesija","Strava nad nama","Djeca noći","Lovci i lovine","Reiserova tajna","Tri istine","Strah na dnu mora","Ravenov povratak","Satelit ubojica","Smrtonosni projekt","Bratstvo sjene","Egzodus","Zaraza","Maskirani osvetnik","Babilonska biblioteka","Gusari","Ljudska meta","Smrtonosna partija","Bauhaus ubica","Lov na čovjeka","Priča o Keti Teler","Tor 14","Zmajeva osveta","Završni turnir","Dvoboj u bezdanu","Sablast u kompjutoru","Silazak u podzemlje","More pustoši","Otok na nebu","Bezvremenski rat","Hadija","Zagonetka špilje","Crveni planet","Lovci na viruse","Iskonski instinkt","Mentalna blokada","Leptirov san","Svijet robota","Pomaknuta orbita","Indija","Feniks","Gospodarica smrti","Crveni anđeo","Noćna mora u svemiru","Nakon revolucije","Smrtonosni koncert","Osvetnik","Noć prokletih","Ponoćni bluz","Željezna maska","Duga noć","Teror iz podzemlja","Gospodari Marsa","Prošli životi","Prva razina","Tajna Babilona","Vizije budućnosti","Grad proroka","Ledena dama","Put u slobodu","Zavjesa tišine","Onkraj vremena i prostora","Prožderatelj svjetova","Selenina osveta","Broj 100","Strava iz dubina","Pjesma za Saru","Očajnički bijeg","Neprijatelj iz sjene","Misija visokog rizika","Pakt","Alfa","Iz pepela","Mutni poslovi","Zvijezda","Zvijeri","Podzemni grad","Flashpoint","Visoke financije","Putovanje kroz vrijeme","Duša grada","Teritorij","Ubačeni agent","Beskonačni univerzumi","Mreža","Signali iz svemira","Staza u plamenu","Točka nestajanja","Tko je Solomon Darver?","Grad nasilja","Utrka sa smrću","Buđenje Thora 14","Zarobljenici otoka","Prava priča o mister Alfi","Misterij trećeg mjeseca","Vjetrovi rata","Orlovsko gnijezdo","Duhovi prošlosti","Državni neprijatelj","Midian","Mutant","Šifra: Nula","Umijetni život","Nužna samoodbrana","Bijela smrt","Cijena moći","Izazov u svemiru","Tajna tuđinskog stvorenja","Bol pamćenja","Propovjednik","Tehnodroidi","Zora apokalipse","Aristotel Skotos","Shaolin","Slučaj za Solomona Darvera","Pokolj","Vučje lice","Svemirski brod iz prošlosti","Velike brzine","Šuma straha","Ultimatum Zemlji","Objava rata","Dan junaka","Pod maskom","Pad Uranije","Poslije apokalipse","Tajni odred","Posljednji pozdrav",]
    private static let dates_nathanNever: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_nathanNever: [String:Int] = [ "000":16,"001":95,"002":95,"003":95,"004":95,"005":95,"006":95,"007":95,"008":95,"009":95,"010":95,"011":93,"012":95,"013":103,"014":95,"015":95,"016":95,"017":95,"018":95,"019":95,"020":95,"021":96,"022":95,"023":95,"024":95,"025":95,"026":103,"027":95,"028":95,"029":95,"030":95,"032":95,"033":95,"034":95,"035":95,"036":95,"037":95,"038":103,"039":95,"040":95,"041":95,"042":95,"043":111,"044":95,"045":95,"046":95,"047":94,"048":95,"049":95,"050":135,"051":94,"052":95,"053":95,"054":95,"055":95,"056":95,"057":95,"058":95,"059":95,"060":95,"061":95,"062":95,"063":103,"064":95,"065":95,"066":95,"067":95,"068":95,"069":95,"070":95,"071":96,"072":100,"073":95,"074":103,"075":96,"076":95,"077":95,"078":95,"079":95,"080":95,"081":95,"082":95,"083":95,"084":95,"085":95,"086":103,"087":95,"088":95,"089":95,"090":95,"091":95,"092":95,"093":95,"094":95,"095":96,"096":96,"097":96,"098":97,"099":96,"100":95,"101":95,"102":95,"103":95,"104":95,"105":95,"106":95,"107":95,"108":95,"109":95,"110":95,"111":95,"112":95,"113":95,"114":95,"116":96,"117":95,"118":95,"119":96,"120":95,"121":95,"122":96,"123":95,"124":95,"125":96,"126":95,"127":95,"128":95,"129":95,"130":95,"131":95,"132":96,"133":96,"134":96,"135":97,"136":97,"137":97,"138":96,"139":96,"140":96,"141":98,"142":98,"143":98,"144":100,"145":100,"146":100,"147":100,"148":100,"149":100,"150":100,"151":100,"152":100,"153":99,"154":99,"155":99,"156":99,"157":99,"158":99,"159":99,"160":99,"161":99,"162":99,"163":99,"164":99,]
    // =====komandantMark=====
    private static let numbers_komandantMark: [String] = ["001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","034","035","038","039","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080","081","082","083","084","085","086","087","088","089","090","091","092","093","094","095","096","097","098","099","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","279","280","281",]
    private static let titles_komandantMark: [String] = ["Komandant Mark","Vukovi sa Ontarija","Zaliv gromova","Blago mrtvog gusara","Klopka na brodu","Herojska predstraža","Dragoceni tovar","Streljanje u zoru","Vobak napada","Otmica Žalosne Sove","Izazov smrti","Neko je izdajnik","Plamena grobnica","Tajanstvena senka","Avetinjski brod","Čovek bez lica","Spas u reci","Most iznenađenja","Dvaput mrtav","Nestanak svetog štita","Crni lav","Pobedonosni marš","Prijatelj otrovnica","Zloglasni general","Nečista savest","Fakir Sudraka","Opsednuti grad","Prošlost optužuje","Lovac na glave","Napušteni logor","Veliki medved","Tigar sa Martinika","Zmija u nedrima","Dvojica skalpiranih","Dželati ne kasne","Glenov testament","Kožni nos","Izgubljena opklada","Skriveni maglom","Mrtva usta","Moć, vatrene vode","Agonija u reci","El Kajmanovi lešinari","Ploveća lomača","Krvavi trougao","Blago vikinga","Ostrvo prokletih","Poverljiva poruka","Dug pohlepi","Crna smrt","Nestali konvoj","Tri časa isčekivanja","Novi saveznici","Orao u kavezu","Ratna mašina","Neme puške","Prašak zaborava","Pomorska bitka","Čovek od slame","Pleme crne lisice","Izazov reci","Pesnice od mermera","Gospodar močvare","Homerova bista","Pošteni Džekob","Kurir Veldon","Put osvete","Četiri saučesnika","Dvostruko dno","Radžini ambasadori","Noć iznenađenja","Tajna Fervila","Zaslepljen zlatom","Kočije sa blagom","Četvrta žrtva","Dvoboj u zoru","Dijadema od perja","Podzemni hodnik","Karipski car","Zagonetni sat","Markov dvojnik","Gnev Kajuga","Tajna belih lisica","Zloglasna jama","Očeva sablja","Zaseda na moru","Lažni grob","Mark na lomači ","Naručeni izdajnik","Crna udovica","Smelo bekstvo","U mreži","Zamka na Antilima","Šeikova robinja","Oaza Kirmah","Krilati vesnik","Priča o komandantu Marku","Esmeraldin krik","Taoci","Maskirani profesor","Mark protiv mumije","Moćna Nemeris","Gnev Imotepa","Povratak u Ontario","Sakem plemena","Mark i Spartak","Srebrni tanjir","Čarobna knjiga","Fred kukumavka","Zarobljenicа Konsuela","Astorovo proleće","Vumbuli statua","Vatrena kula","Rodoljub Trevor","Mržnja Montrozovih","Svadbeni ručak","Nasledstvo Kanubah","Neobični lord","Ljudi Urijerla","Biksbi grozni","El Maskarenova tvrđava","Mazga Tilikus","Hijena iz Storka","Brodolomnik","Magija Žalosne Sove","U Kandžama varalice","Robovi močvare","Tajna jednorukog","Avet ponora","Markova šala","Opsada Ontarija","Na ivici smrti","Blago Si-gala","Očajnički korak","Izdaja mrtvaca","Vojnik smrti","Potraga za Blafom","Neumoljivi","Stena strave","Leteći mesec","Podvig Žalosne Sove","U kandžama golijata","Pobuna Urona","Lažni glasnik","Markova zaštitnica","Klopka za Marka","Topovnjača nad Ontarijem","Misteriozna carica","Zlosutni dan","Dragoceni mamac","Hromi gavran","Veliki Meteorus","Atentat na Marka","Brod očajnika","Sinovi Bahmoka","Žalosna Sova u plamenu","Tajni kovčeg","Dvostruko izdajstvo","Kuća strave","Lađa u plamenu","Nepokolebljiva vernost","Gospodar zla","Džin Efraim","Čovek s ožiljkom","Brilijantska naušnica","Zlatni kovčeg","Zlatokosa","Porodica Lafore","Lažni Vukovi","U zamci gusara","Osvetnička braća","Nepoznati razbojnik","Sramna ucena","Hijena Šenki","Kraljičina garda","Gulikoža","Čarobna Suska-jaga","Dobrotvor","Crvenokosa skvo","Tigar među vukovima","Čarobnjak Gundura","Niblosov jedrenjak","Nevina zatočenica","Flokova izdaja","Neznanac s lukom","Mesečarka","Isčezli garnizon","Noć osuđenih","Kanonada","Šifra B.F.","Na život i smrt","Živ u plamenu","Ficrojeva banda","Dolina skeleta","Pljačkaši","Zmija otrovnica","Žeđ","Rat špijuna","Bez milosti","Monstrumi sa reke","Kraljica zmija","Odmetnici","Osveta veštice","Guanaboko","'Biser' Atlantika","Prokleta planina","Markovo venčanje","Kradljivci zlata","Poslednja želja","Senke prošlosti","Osujećena zavera","Kroz dimnu zavesu","Leglo otrovnica","Artemisovo blago","Na zemlji Arikara","Savršeni dvojnik","Koreni Kenebeka","Žeđ za zlatom","Mamac za ubicu","Donovanovi strelci","Ponoćna poseta","Tvrda koža","Šakal Nezbi","Po cenu života","Bunkerova taktika","Tajni pratilac","Omča za nevinog","Jozafatove hijene","Gorka istina","Zavera na Jamajki","Okrutni Kid","Svedok optužbe","Poslednji juriš","Tajanstvena tvrđava","Velika prevara","Mučenje","Kajankasi","Lov na špijune","Otmica","Na silu skvo","Otrov","Trgovac smrću","Bura","Osvetnica","Počasni vrač","Kraftonovi plaćenici","Radžin nakit","Opasnost nad Ontarijem","Pećina Maja","Otkupnina","Šifra 'Crni zrak'","Kći Sunca","Poternica","Izdaja","Ledeni ambis","Dva pukovnika","U vučjem prolazu","Grob Vikinga","Ratovanje na Mohavku","Tajanstveni saveznik","Izgubljeni talisman","Senka vešala","Kobna zaseda","Ratnici crne močvare","Zvezda sa juga","Indijanska princeza","Neraščišćeni računi","Agent Darsi","Okršaj na Barbadosu","Povratak u Itaku","Kralj lopova","Gospodar bitaka","Vojni sud","Besmrtnici","Most na Tuskali","Velika trka","Konačna pobeda",]
    private static let dates_komandantMark: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_komandantMark: [String:Int] = [ "001":65,"002":65,"003":65,"004":65,"005":65,"006":65,"007":66,"008":66,"009":65,"010":65,"011":65,"012":65,"013":66,"014":65,"015":65,"016":66,"017":65,"018":65,"019":65,"020":65,"021":65,"022":65,"023":65,"024":66,"025":65,"026":66,"027":66,"028":66,"029":65,"030":65,"031":66,"032":66,"033":65,"034":65,"035":66,"038":65,"039":65,"041":66,"042":65,"043":65,"044":66,"045":65,"046":65,"047":65,"048":65,"049":66,"050":65,"051":65,"052":65,"053":65,"054":65,"055":66,"056":66,"057":65,"058":65,"059":66,"060":65,"061":66,"062":66,"063":65,"064":65,"065":65,"066":65,"067":66,"068":66,"069":66,"070":66,"071":65,"072":66,"073":65,"074":65,"075":65,"076":65,"077":65,"078":65,"079":65,"080":66,"081":66,"082":65,"083":66,"084":65,"085":66,"086":65,"087":66,"088":65,"089":65,"090":66,"091":65,"092":66,"093":65,"094":65,"095":65,"096":65,"097":65,"098":65,"099":65,"100":97,"101":66,"102":65,"103":66,"104":65,"105":64,"106":65,"107":65,"108":66,"109":65,"110":65,"111":65,"112":65,"113":65,"114":66,"115":65,"116":66,"117":65,"118":65,"119":65,"120":65,"121":66,"122":66,"123":65,"124":65,"125":65,"126":65,"127":65,"128":65,"129":65,"130":65,"131":65,"132":66,"133":65,"134":66,"135":65,"136":65,"137":66,"138":66,"139":65,"140":66,"141":66,"142":66,"143":65,"144":65,"145":65,"146":66,"147":65,"148":65,"149":66,"150":66,"151":66,"152":65,"153":65,"154":65,"155":65,"156":65,"157":65,"158":65,"159":65,"160":65,"161":65,"162":65,"163":65,"164":65,"165":65,"166":65,"167":65,"168":65,"169":65,"170":65,"171":65,"172":65,"173":65,"174":65,"175":65,"176":65,"177":64,"178":65,"179":65,"180":64,"181":65,"182":65,"183":65,"184":65,"185":65,"186":65,"187":65,"188":65,"189":65,"190":65,"191":65,"192":65,"193":65,"194":65,"195":65,"196":65,"197":65,"198":65,"199":65,"200":64,"201":65,"202":65,"203":65,"204":65,"205":65,"206":65,"207":65,"208":65,"209":65,"210":65,"211":65,"212":65,"213":65,"214":65,"215":65,"216":65,"217":65,"218":64,"219":65,"220":65,"221":65,"222":65,"223":63,"224":65,"225":65,"226":65,"227":65,"228":65,"229":65,"230":65,"231":64,"232":65,"233":65,"234":65,"235":65,"236":65,"237":50,"238":65,"239":65,"240":65,"241":65,"242":65,"243":65,"245":65,"246":65,"247":65,"248":65,"249":65,"250":65,"251":65,"252":65,"253":65,"254":65,"255":65,"256":65,"257":49,"258":65,"259":65,"260":65,"261":65,"262":65,"263":65,"264":65,"265":65,"266":65,"267":65,"268":65,"269":65,"270":65,"271":65,"272":65,"273":65,"274":65,"275":49,"276":65,"277":65,"278":65,"279":64,"280":65,"281":93,]
    // =====ninja=====
    private static let numbers_ninja: [String] = ["001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","034","035","036","037","038","039","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080","081","082","083","084","085","086","087","088","089","090","091","092","093","094","095","096","097","098","099","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155",]
    private static let titles_ninja: [String] = ["Osveta je njegova","Planina straha","Predsoblje pakla","Pokolj zbog milion dolara","Crni čarobnjak","Vratnice smrti","Vašington D.C.","Smrt...to sam ja","Ninđa i duhovi","Jedan čovek za Manilu","Banzai","Tri, dva, jedan...smrt","Rokenrol za Kerol Grej","Crveni pesak smrti","Kad zvižde šurikeni","Ko se poslednji smeje...","U orbiti smrti","Do pakla i dalje","Tri smrti Dezmonda Bejkera","Noć čeličnih zvezda","Sablast crnih močvara","Bez milosti, bez povratka","Pakleni vakizaši","Smrt sa pozivnicom","Purpur, zlato i krv","Tajne ruševine Uruapana","Kako ubiti vampira","Karneval mrtvih","Dijamanti iz pakla","Klopka za ninđu","Hrabri umiru samo jednom","Vreli pesak smrti","Na oštrici noža","Senke na vodi","Tajfun smrti","Nebo se ogleda u krvi","Krvavi mač sudbine","Smrt stiže u ponoć","Čovek koji nije umeo da umre","Za smrt je potrebno troje","Zubi zmije otrovnice","Dolina bele smrti","Operacija ponoć","Pobuna u ćeliji smrti","Žena čije ime znači smrt","Pakleni kvartet","Noć za umiranje","Na tragu demona","Bela smrt i crna smrt","Indijska veza","Izlet u pakao","Ples mrtvih","U čeljustima tigra","Krvava enigma","I vetar je rekao smrt","Ninđa dolazi gazeći po krvi","Grad ukletih","Poslednja igra smrti","Osveta ninđe","Iscereni zubi smrti","Čovek koji je ubijao strahom","Mržnja ninđa je večna","Oštrica vreba u tami","Škola Kuđi-kiri","Striptiz smrti","Poruka iz pakla","Kiše života, kiše smrti","Staza prokletstva","Trag ninđe vodi u pakao","Smrt ima dva lica","Ledeni dah smrti","Ubiću te ninđo","Smrt je moja ljubavnica","Stepenice straha","Noć krvavih noževa","Vreli poljupci smrti","Sinovi pakla","Pod senkom smrti","I osveta je crna","Vetar donosi miris krvi","Ninđe ubijaju ćuteći","Brži od same smrti","Blesak očiju, blesak sečiva","Crni ujed smrti","Umreti u San Francisku","Krv protiče u sumrak","Ninđa pred vratima pakla","Bodež crnog zmaja","Katana bluz u đavoljem vrtu","I smrt je olakšanje","Moja krv ne prašta","Sunce u oku, smrt u srcu","Pravo u srce demona","Uzalud pucaš, ninđa je večan","Šaka smrti prva udara","Sa krikom u očima","Šuriken za pozdrav Đavolu","Crveno sunce u San Francisku","Krv, čelik, i .... kraj","Smrt ne bira","Završni udarac za pakao","Osveta stiže iz pakla","Ninđa i kradljivci života","Ne traži vetar smrti","Močvara straha","S one strane života","Gospode, kako taj udara","Ninđa i ratnici smrti","Kobna otmica u Parizu","Za Korientas, za pakao","Aveti prošlosti","Smrt dolazi","Senka gvozdenog krsta","Krvavi sumrak","Sablasna molitva","Između sna i pakla","Senka sečiva","Karneval smrti","Senke predaka","Mala trgovina užasa","Posao za proklete","Osam, devet, deset - smrt","Pozorište senki","Šifra 'Alameda'","Duh ukletog samuraja","Samo je katana sudija","Pustinjski pakao","Poslednji ronin","Porcelanske ubice","Pukotina budućnosti","Ključevi straha","U vrtlogu smrti","Trag Đavola","Bajka o umiranju","Belo usijanje","Suza na oštrici mača","Grom i strah","Gospodari bele smrti","Ništavilo","Lažni samuraj","Ugovor sa pokojnikom","Igra za gubitnike","Vampiri iz L.A.","Trka za opstanak","Žaoka u srcu","U srcu vulkana","Na kraju puta","Nebeski oganj","Smrt je nema","Zveri na tragu","Zlatni mač","Paklena igra u 'Maloj Odesi'","Smrt je njegova senka","Ninđa protiv Ninđe","Nebeski glasnik",]
    private static let dates_ninja: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_ninja: [String:Int] = [ "001":81,"002":94,"003":85,"004":92,"005":82,"006":83,"007":95,"008":88,"009":88,"010":91,"011":74,"012":79,"013":79,"014":95,"015":94,"016":94,"017":94,"018":94,"019":92,"020":94,"021":94,"022":93,"023":95,"024":94,"025":95,"026":94,"027":95,"028":93,"029":94,"030":93,"031":93,"032":94,"033":87,"034":94,"035":94,"036":94,"037":94,"038":94,"039":95,"040":92,"041":93,"042":94,"043":93,"044":95,"045":92,"046":94,"047":93,"048":93,"049":92,"050":94,"051":92,"052":86,"053":92,"054":92,"055":94,"056":94,"057":94,"058":93,"059":92,"060":93,"061":93,"062":94,"063":92,"064":92,"065":93,"066":93,"067":95,"068":92,"069":95,"070":94,"071":92,"072":92,"073":92,"074":92,"075":98,"076":95,"077":94,"078":93,"079":94,"080":94,"081":94,"082":93,"083":94,"084":92,"085":92,"086":94,"087":94,"088":95,"089":93,"090":91,"091":93,"092":94,"093":93,"094":91,"095":92,"096":76,"097":91,"098":93,"099":92,"100":95,"101":93,"102":93,"103":93,"104":90,"105":95,"106":92,"107":91,"108":91,"109":75,"110":91,"111":93,"112":93,"113":90,"114":91,"115":92,"116":90,"117":93,"118":90,"119":81,"120":80,"121":94,"122":94,"123":94,"124":93,"125":95,"126":95,"127":95,"128":94,"129":80,"130":93,"131":95,"132":95,"133":94,"134":95,"135":95,"136":93,"137":95,"138":79,"139":94,"140":95,"141":95,"142":95,"143":95,"144":95,"145":95,"146":95,"147":95,"148":95,"149":95,"150":95,"151":95,"152":95,"153":95,"154":95,"155":95,]
    // =====asterix=====
    private static let numbers_asterix: [String] = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34",]
    private static let titles_asterix: [String] = ["Asteriks galski junak","Asteriks i zlatni srp","Otmica Aspirinksa","Asteriks gladijator","Put oko sveta","Asteriks i Kleopatra","Borba starešina","Asteriks među Britancima","Asteriks i Normani","Asteriks i legionari","Štit iz Overnije ","Asteriks na olimpijadi","Bakarno kazanče","Asteriks u Španiji","Razdvojeno selo","Asteriks u Švajcarskoj","Grad bogova","Cezarov venac (Velika opklada)","Vrač pogađač","Asteriks na Korzici ","Cezarov poklon","Velika plovidba","Preduzeće Obeliks (Sve za umetnost)","Asteriks među Belgijancima","Velika podela","Pustinjska odiseja (Rimski druid)","Asteriks i sin","Asteriks i leteći ćilim","Ruža i mač","Obeliksova galija","Asteriks i Latravijata","Početak školske godine","Asteriks i nebo koje pada","Zavadi pa vladaj ",]
    private static let dates_asterix: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_asterix: [String:Int] = [ "01":45,"02":43,"03":44,"04":90,"05":45,"06":45,"07":45,"08":45,"09":45,"10":45,"11":45,"12":45,"13":45,"14":45,"15":45,"16":45,"17":45,"18":45,"19":45,"20":45,"21":45,"22":44,"23":45,"24":45,"25":45,"26":45,"27":45,"28":45,"29":44,"30":45,"31":45,"32":33,"33":45,"34":45,]
    // =====dylanDog=====
    private static let numbers_dylanDog: [String] = ["001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","034","035","036","037","038","039","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080","081","082","083","084","085","086","087","088","089","090","091","092","093","094","095","096","097","098","099","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","335","340","345","346","347","348","349","350",]
    private static let titles_dylanDog: [String] = ["Zora živih mrtvaca","Džek trbosek","Noći punog meseca","Priviđenje Ane Never","Ubice","Demonska lepota","Zona sumraka","Oči zla","Alfa i omega","Iza ogledala","Veliki Dijabolo","Emet","Među nama","Između života i smrti","Kanal 666","Dvorac straha","Dama u crnom","Njujork, Njujork","Uspomene nevidljivog","Motel Bejts","Prokleti dan","Tunel strave","Metamorfoze","Ružičasti zečevi ubijaju","Morgana","Posle ponoći","Video sam kako umireš","Oštrica brijača","Dok grad spava","Šesto čulo","Zavesa pada","Opsesija","Džekil","Tama","Senke prošlosti","Strava letnje noći","Džungla na asvaltu","Glas iz magle","Gospodar tišine","Dogodiće se sutra","Golkonda","Hijena","Priča ni o kome","Odblesci smrti","Goblin","Dva lica istine","Zapisano krvlju","Direktni prenos","Sto godina kasnije","Granice vremena","Zlo","Presuda","Kraljica noći","Delirijum","Buđenje mumije","Senke","Povratak u zonu sumraka","Kamena klepsidra","Safara","Frankenstein","Užas beskonačnosti","Vampiri","Maelstrom!","Tajne Ramblina","Zver iz pećine","Partija sa smrću","Čovjek sa dva života","Sablast u noći","Lov na veštice","Šuma ubojica","Bogomoljkini zločini","Poslednji uštap","Armagedon","Dugački pozdrav","Koljač","Crna magija","Poslednji čovek na Zemlji","Ubice dolaze iz mraka","Vila zla","Kileksov mozak","Džoni nakaza","Daleko od svetlosti","Doktor teror","Zed","Utvare","Priča jednog sirotog đavola","Krvavi praznici","S druge strane smrti","Konjanici vremena","Titanik","Preobražaj","Mozaik horora","Prikazanja","Žena koja ubija prošlost","Dani more","Sukob","Iza zavjese","Sotonin pogled","Simfonija smrti","Priča o Dylanu Dogu","Vrata pakla","Braća iz drugog vremena","Demoni","Beskrajna noć","Stravična invazija","Pobuna automobila","Zemlja obojenih sjena","Čuvar uspomena","Nojev let","Arakne","Proročanstvo","Bliski susreti","Mračna polovica","Tamnica od papira","Zvjerski brlog","Dadilja","Peto godišnje doba","Igra sudbine","Mačje oko","Ponor","Sve dok vas smrt ne rastavi","Granica","Phoenix","Vještičji vrh","Tri puta nula","Crvena smrt","Johnnyjevo srce","Zov šume","Killexov povratak","Prizivač duhova","Dok padaju zvijezde","Prodavač vremena","Ananga","Jaguarov krik","Skener","Netko nas zove odozgo","Izgubljeni grad","Loše misli","Nesmiljeni Hook","Prema dalekome svijetu","Crna duša","Apokalipsa","Da umreš od ljepote","Pakleni pas","Hotel duhova","Zvjezdana prašina","Ponori ludila","Svemirac","Poljubac zmije","Jezero na nebu","Dostava smrti","Cesta za nigdje","Otkucaji vremena","Nova vrsta","Div","San razuma","Rođen za ubijanje","Superosjetilni opažaji","Druid","Osmijeh mračne dame","Bog u tamnici","Savršeni svijet","Urlatorica","Pasji otok","Preživjeti u raju","Meduza","Rijeka zaborava","Zrcalo duše","Mala smrt","Obuzeta sotonom","Uspomene iz podzemlja","Za šaku novca","Nesretni zgoditak","Sjeme ludila","Projekt","Učenik","Pisma iz pakla","Treća strana medalje","Noćni lov","Znak vampira","Safara","Rekvijem za čudovište","Misterij Venecije","Fobija","Crni čovjek","Izgubljene ljubavi","Cijena smrti","Tajna Mordecaija","Šarada","Sunčeve pjege","Vječna iluzija","Vještica iz Brentforda","Čudnovati klijent","Tko je ubio Djeda Božićnjaka","Četiri elementa","Zakon džungle","Homo homini lupus","Broj dvjesto","Daisy &amp; Queen","Sedmi krug","Obitelj Milford","Uskrsnuće","Školski drug","Magla","Hram drugoga života","Nepoznati svijet","Zvijer","Čarobni frulaš","Kuća duhova","Nekropolis","Ubica veštica","Manila","Bunar prevara","Prokleta knjiga","Veliki san","Naslikani košmar","Deseta žrtva","Nelojalna konkurencija","Đavolov dodir","Mudrost mrtvih","Dva života Drim","Na talasima sećanja","Nesanica","Ne umreti za 24 časa","Ubilački instinkt","Preko praga","Nebo može da čeka","Misteriozni sused","Nightmare tour","Utvara iz Skotland Jarda","Nepoželjni gost","Poslednja karta","Demonska sonata","Predodređene žrtve","U senci vulkana","Naslednici zone sumraka","Veliko đubre","Ukronija","U ime oca","Ubica je među nama","Marti","Groblje nakaza","Krčma na kraju sveta","Sve Saline ljubavi","Duša od čelika","Sahranjena sećanja","Lift za pakao","Čuvar svetionika","Poltergajst!","Salivanova čudovišta","Prokockani životi","Soba broj 63","Okrutni Takur","Čuvar","Upirov bes","Iz daleke galaksije","Kasperov usud","Pozdrav iz Munlajta","Palikuća","Breg zečeva","Lijam lažov","Reinkarnacije","Zmajeve kandže","Stvari s drugog sveta","Formular A38","Profesionalci","Gospodar muva","Maleni đavo","Pokolj Grejemovih","Živi sahranjeni","Beg od prošlosti","Trinaesti čovek","Neznanac na putu","Dan Likantropa","Silazak u ponor","Vrt iluzija","Mater Morbi","Životni put","Opasne veze","Progonitelj","U znaku bola","Kradljivac umova","Program rehabilitacije","Novi varvari","Prinudni rad","Put zagonetki","Mračni naslednik","Nema trika, nema prevare","Zarobljene duše","Poslednji besmrtnici","Padaju žabe","Muž i Žena","Druga šansa","Vradžbina","U glavi ubice","Verna klijentela","Obiteljski portret","Balsamator","Savršeni zločin","Proždirač kostiju","Strava na visini","Muzej zločina","Kovčeg s blagom","Ubojica iz susjedstva","Božica majka","Obdukcija","Ja, čudovište","Ocjena Gavrana","Tuđinska epidemija","Krah","Znakovi kraja","Legija kostura","Blacky","Prevarant","Urbane legende","Povratnici","Bjegunica","Mladi vampiri","Plač vile narikače","Balorovo oko","Mržnja nikad ne umire","Novi život","Na koži","Mjesečari","Treš ajland","...i budi lijep leš","Predivno stvorenje","Kalvarija","Dobro došli u Vikedford","Duhovi čuvari","...i u prah ćeš se vratiti","Napušteni","Pogrešna ruka","Smrt ne zaboravlja","Suze iz kamena",]
    private static let dates_dylanDog: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_dylanDog: [String:Int] = [ "001":97,"002":95,"003":95,"004":96,"005":95,"006":95,"007":95,"008":95,"009":95,"010":95,"011":95,"012":95,"013":95,"014":95,"015":95,"016":95,"017":95,"018":95,"019":95,"020":95,"021":95,"022":95,"023":95,"024":95,"025":95,"026":95,"027":95,"028":95,"029":95,"030":95,"031":95,"032":95,"033":95,"034":95,"035":95,"036":95,"037":95,"038":95,"039":95,"040":95,"041":95,"042":95,"043":95,"044":93,"045":93,"046":95,"047":95,"048":95,"049":95,"050":105,"051":95,"052":95,"053":95,"054":95,"055":95,"056":95,"057":95,"058":95,"059":95,"060":95,"061":95,"062":95,"063":95,"064":95,"065":96,"066":95,"067":95,"068":95,"069":95,"070":95,"071":95,"072":95,"073":95,"074":95,"075":95,"076":96,"077":111,"078":95,"079":95,"080":95,"081":95,"082":95,"083":95,"084":95,"085":95,"086":95,"087":95,"088":95,"089":95,"090":95,"091":95,"092":95,"093":95,"094":95,"095":95,"096":95,"097":95,"098":95,"099":95,"100":95,"101":95,"102":95,"103":95,"104":95,"105":95,"106":95,"107":95,"108":95,"109":95,"110":95,"111":95,"112":95,"113":95,"114":95,"115":95,"116":95,"117":95,"118":95,"119":95,"120":95,"121":111,"122":95,"123":95,"124":94,"125":95,"126":95,"127":95,"128":95,"129":95,"130":95,"131":95,"132":95,"133":95,"134":95,"135":95,"136":95,"137":95,"138":95,"139":95,"140":95,"142":95,"143":95,"144":95,"145":95,"146":95,"147":95,"148":95,"149":95,"150":95,"151":95,"152":95,"153":95,"154":95,"155":95,"156":95,"157":95,"158":95,"159":95,"160":95,"161":95,"162":95,"163":95,"164":95,"165":95,"166":95,"167":95,"168":95,"169":95,"170":95,"171":95,"172":95,"173":95,"174":95,"175":95,"176":95,"177":95,"178":95,"179":95,"180":95,"181":94,"182":95,"183":95,"184":95,"185":95,"186":95,"187":95,"189":95,"190":95,"191":95,"192":95,"193":95,"194":95,"195":95,"196":95,"197":95,"198":95,"199":95,"200":95,"201":95,"202":95,"203":95,"204":95,"205":95,"206":95,"207":95,"208":95,"209":96,"210":95,"211":95,"212":95,"213":95,"214":95,"215":95,"216":95,"217":95,"218":95,"219":95,"220":95,"221":95,"222":95,"223":95,"224":95,"225":95,"226":95,"227":95,"228":95,"229":97,"230":95,"231":95,"232":95,"233":95,"234":95,"235":95,"236":95,"237":95,"238":95,"239":95,"240":95,"242":95,"243":95,"244":95,"245":95,"246":95,"247":95,"248":95,"249":95,"250":95,"251":95,"252":95,"253":95,"254":95,"255":95,"256":95,"257":95,"258":95,"259":95,"260":95,"261":95,"262":95,"263":95,"264":95,"265":95,"266":95,"267":95,"268":95,"269":95,"270":95,"271":95,"272":95,"273":95,"274":95,"275":95,"276":95,"277":96,"278":95,"279":95,"280":95,"281":95,"282":95,"283":95,"284":95,"285":95,"286":95,"287":95,"288":96,"289":96,"290":95,"291":96,"292":95,"293":96,"294":96,"295":96,"296":96,"297":96,"298":95,"299":95,"300":95,"301":95,"302":95,"303":96,"304":96,"305":96,"306":95,"307":95,"308":96,"309":95,"310":95,"311":95,"312":96,"313":96,"314":96,"315":96,"316":96,"317":97,"318":97,"319":96,"320":98,"321":97,"322":97,"323":97,"324":98,"325":97,"326":97,"327":97,"328":99,"329":98,"330":99,"335":100,"340":100,"345":100,"346":100,"347":100,"348":100,"349":100,"350":108,]
    // =====texWiller=====
    private static let numbers_texWiller: [String] = ["001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","026","027","028","029","030","031","032","033","034","035","036","037","038","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080","081","082","083","084","085","086","087","088","089","090","091","092","093","094","095","096","097","098","099","101","102","103","104","105","106","107","108","109","110","111","112","113","114","116","117","118","119","120","121","122","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","143","144","145","146","147","148","149","150","151","152","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","344","345","346","347","348","349","350","351","352","353","354","355","356","365","366","367","368","369","370","371","372","373","374","375","376","377","378","379","380","381","382","383","384","385","386","387","388","389","390","391","392","393","394","395","396","397","398","399","400","401","402","403","404","405","406","407","408","409","410","411","412","413","414","415","416","417","418","419","420","421","422","423","425","427","428","429","430","431","432","433","434","435","436","437","438","439","440","441","442","443","444","445","446","447","448","449","452","453","454","455","456","457","458","459","460","461","462","463","464","465","466","467","468","469","470","471","472","473","474","475","476","477","478","479","480","481","482","483","484","486","487","488","489","490","491","492","493","494","496","497","498","499","500","501","502","503","504","505","507","508","509","510","511","512","513","514","515","516","517","518","519","520","521","522","523","524","525","526","527","528","529","530","531","532","533","534","535","536","537","538","539","540","541","542","543","544","545","546","547","548","549","550","551","552","553","554","555","556","557","558","559","560","561","562","569","570","571","572","573","574","575","576","577","578","579","580","581","582","583","584","585","586","587","588","589","590","591","592","593","594","595","596","597","598","599","600","601","602","603","604",]
    private static let titles_texWiller: [String] = ["Zaseda u kanjonu","Jedan protiv dvadeset","Smrt u senci","Brži od zvečarke","Satanijino čudovište","Tajna doline aveti","Zakon odmazde","Na krvavom tragu","Avantura na Rio Grande","Očekujući nož","Živa lavina","Sin Noćnog Orla","Šaka mrtvaca","Panteri ubice","Na brdu lešinara","Ranč u pepelu","Pustinjska pravda","Lov na lisice","Između dve vatre","Vatre u noći","Orlov vrh","Džampa Flet","Ruke Noćnog orla","Veliki Gavran","Zavere u senci","Rajakurina osveta","Dugoruki Landers","Crni kojot","Noćni jahači","Zeleni mesec","Čovek bez prsta","Bokser Pat","Pat sređuje račune","Vindeksove pume","Hajka za nevidljivim","Talasi Pekosa","Cveće za Miltona","Mefistov krah","Istraživači zlata","Bodljikava žica","Mudra Raskar","Crna straža","Neubedljiv dokaz","U znaku zmaja","Strela Mah-shai","Dimne poruke","Zmija s perjem","Grad buktinja","Samoubilački eskadron","Karsonova odluka","Trojica maskiranih","Bubnjevi Mohikanaca","Dramatičan lov","Karson nema sreće","Zlokobna noć","Trka u Las Vegasu","Podmukli osvetnik","Teror na Rio Sonori","Noćna poruka","Zakon linča","Spasonosni revolver","Pobesnelo krdo","Pohlepni Romero","Trapez smrti","Drama u cirkusu","Ortegin bič","Noćni napad","Pruka Ta-hu-naha","Ruševine Bonita","Zendino sklonište","Zlatno zvono","Dugo koplje","Bela pustinja","Pero Komanča","Dolina jaguara","Ozloglašeni El Plateado","Bela noć","Banda vukova","Jazbina žigosanih","U rukama Čejena","Zlokobno koplje","Šampion rodea","Šakali Šangaj Kelija","Proteusov žig","Nemilosrdni","Krug smrti","Teksova pravda","Konjanici smrti","Kazna za oholog pukovnika","Noćni prepad","Beli vrač","Crni baron","Klopka za Vendija","Kameni totem","Ruke uvis","Kobna greška","Indijanski zavet","Tajna mumije","El Morisko","Stižu Ruralesi","Zakletva","Gnevni Teks","Sablasni brod","Crno oko","Pakao u Rober-sitiju","Poslednji metak","Chinatown","As u rukavu","Omča se steže","Između dvije zastave","Čovek iz Kentakija","Anubijev pečat","Izazov smrti","Zakon Roja Bina","Afera Spenser","Zakon Kolta","Odrešene ruke","Zarobljenik Žutog Gavrana","Mefistov sin","Četiri talismana","Crna magija","Ukleti jedrenjak","Kanjon izgubljenih","Velika ucena","Strela Komanča","Vatrena barijera","Durangov karavan","Izvor života","Vrač Dijablero","Cvet smrti","Poslednja noć","Tragična opsada","Udružena potera","Tragovi mokasina","Teks u tamnici","Osvetnici","Opasan svedok","Karavan nade","Korak do smrti","Kento ne oprašta","Obećana zemlja","Zaseda u salunu","Ruke u plamenu","Meskalerosi","Veliki lov","Gusar Drejk","Uragan","Tiranin na ostrvu","Na granici Kolorada","Čovek na žeravici","Usijani meteor","Krater strave","Yamin povratak","U kraljevstvu Maya","Ples vatre","Apache Kid","Kraj Komančerosa","Noć ubojica","Smaragdni idol","Juriš Navaja","Na tragu Toma Fostera","Bijeli indijanac","Crna uzica","Vrijeme nasilja","Pandža je udarila!","Lovci na skalpove","Mrtvi grad","Sablast u pustinji","Konjanici osvete","Pljačka vlaka","Peti čovjek","Teksas Bil","Zmijski otrov","Lov na čovjeka","Pobunjenik Mingo","Sudac Maddox/Privedite Texa Willera","Čovjek sa stotinu lica/Little Rock","Tajna rudnika","Staza Broncosa","Visoravan kostura","El Muerto","Boot hill","Viktorijevo blago","Traperi!","Neustrašivi ljudi","Utrka strijele","Dakote","Razbojnici s Rio Grandea","U razbojničkoj jazbini","Istočno od Nogalesa","Kristalni idol","Zlato Kolorada","Veliki kanjon","Bezimeni kauboj","Kanadski pobunjenici","Crna litica","Mučenje","Orao i munja","Zmijsko gnezdo","Kuća na rijeci","Linč","Takson","Trgovci oružjem","Vruće olovo","Dva suparnika","Santa Cruz","Trojica ubojica","Ruka sudbine","Rat na pašnjacima","Rekvijem za hulju","Zavjera","Šuma totema","Čovjek i zvijer","Sasquatch","Samoubilački zadatak","Ubiti ili umrijeti","Čovjek vrijedan 2000 dolara","Put Apaša","Tajanstvena piramida","Strašna čarolija","Kubanski klan","Otok mrtvih","Željezna maska","Šah - Mat","Junaci Đavoljeg prolaza","Vatre u noći","U krugu smrti","Sam protiv svih","Trgovci smrću","Otvorene karte","Sjene prošlosti","Sati očaja","Četiri bjegunca","Cruzadov znak","Lovci i lovina","Put bez povratka","Chociseov sin","Okršaj u kanjonu","Sotonin znak","Paklenski bijes","Operacija 'Panama'","Okrutna džungla","Izdajnik","Pandže u tami","Otok užasa","Užarena dolina","Agencija za indijanska pitanja","Nebeski put, Banda Dubrinovih","Skok u ponor","Žeđ za osvetom","Dimni signali","Slomljena strijela","Zloduh Plavih brda","Vruće zemlje","Opasna istraga","Mefistova sjena","Vještica","Tex protiv Yame","Sinovi Sunca","Tajna Sierre Madre","Aztečka grobnica","Razbojnici","Okamenjeni lavirint","Divlji pohod","Na ivici ponora","Lepa Zelda","Četiri pauka","Izgubljeni svet","Legenda o Gundarima","Veliki Džeronimo","Dolina dabrova","Zločin na zaleđenom jezeru","Čovek iza kulisa","Čejen Apanoza","Čejen klub","Argument kalibra 45","Pukovnik Vatson","Prljava prevara","Daglasovi kao taoci","Miltonov testament","Poslednja prevara","Mesec Komanča","Ratni požar","Bekstvo iz Andervila","Lik izdajnika","Vatreno koplje","Iščezli leš","Zakovana vrata","Čovek kostur","Zaštita Noćnog Orla","Ubistvo u Korpus Kristiju","Zaverenici","Atentatori","Zločin u 'Jutarnjoj zvezdi'","Tajna crvene ruke","Četiri smrtne presude","Ranč izgubljenih","U rukama Čejena","Davitelji","Žrtvovanje Kali","Lažno svedočenje","Legenda o belom bizonu","Noć divljih zveri","Kainova loza","Dolina vukova","Zabranjen pristup","El Lobova banda","Skriveno selo","Korumpirani grad","Atentat u Vašingtonu","Šangaj strit","Priznanje","Braća Border","'Misuri i sloboda'","Tiha smrt","Pustinjski duhovi","Močvare Luizijane","Veliki aligator","Smrt dolazi rekom","Desperadosi","Legenda o staroj Misiji","Rudnik straha","Poslednji dan u Benditu","Mali Vuk","Jampa Fork","Put bez povratka","Neočekivani saveznik","Indijanska policija","Srećni susret","Transkanadijana","Plamena barijera","Snegovi dalekog severa","Zenda","Gavranova stena","Ambis","Linč","U senci omče","Nadinina ispovest","Herojska predstraža","Pod nadzorom","Alkatraz!","Zatočenik s 'Albatrosa'","Čovjek s bičem","Sastanak sa smrću","Klopka u rudniku","Bljeskovi nad Meksikom","Chihuahua!","Kradljivci stoke","Uhoda","Thonga tiranin","Lažna uzbuna","Skriveni pištolj","Preko granice","Pozlaćeni ranč","Konjanici","Pravda za Navahose","Ratnik Apača","Zakon oružja","Kraljevstvo tišine","Crni tigar","Malajska tvrđava","Paklenski prolaz","Pakleni indijanac","Kazna","Vrijeme za ubijanje","Moriscova tajna","Ljudi jaguari","Astečki bog","Selo prokletih","Ljudska žrtva","Spletka u Santa Feu","Atentat","Svjedok","Zločinački sporazum","Oštrica u mraku","Topeka!","Spaljeno pismo","Glas u oluji","Zlato Klaatua","Krv u snijegu","Suparničke bande","Sjeme mržnje","Poruka","Okrutni ljudi","Carsonova prošlost","Razbojnici iz Montane","Posljednji okršaj u Bannocku","Strah","Neprijatelj bez lica","Divljina","Zatočenica svjetionika","Buđenje vulkana","Zločin u luci","Krijumčari","Čitači tragova","Smrt na rijeci","Na stazi osvete","Tisuću dolara za smrt","Prijetnja u pustinji","Strava u Silver bellu","Čovjek bez prošlosti","Tajna pergamenta","Žrtveni bunar","Vukovi Kolorada","Smrt prijatelja","Ubojice","Pokolj u Red Hillu","Policijska konjica","Dva revolvera za Jasona","Napad na utvrdu","Cijena pobjede","Wild west show","Kineske sjene","Nepobjedivi","Careva tajna","Okršaj u Sierri","Springfield kalibar 58","Rendžer u opasnosti","Povratak crnog tigra","Mrtva laguna","Noć zombija","Oluja na stjenovitim brdima","Oružana pratnja","Lov na dijamante","Ljudi koji su ubili Lincolna","Moriscov povratak","Zdenci Agua Prieta","Buđenje mumije","Navajska osveta","Iznad zakona","Lanac ubojstava","Na putu za utvrdu Apache","Mescalerosi!","Do zadnje kapi krvi","Dragulj Akbara","Rijeka straha","Sedmorica ubojica","Helltown","Neumoljivi Jack Thunder","Golden pass","Bezimeni grad","Pucnji u noći","Granica","Vrag sa Sierre","Brijeg smrti","Svjedoci optužbe","Dugo putovanje","Šerif u nevolji","Predznak","Čovjek koji je došao s rijeke","Divlji izazov","Sablasni rudnik","Prokleta brda","Brežuljci Siouxa","Vjetar mržnje","Bijeli oblak","Hladnokrvno ubojstvo","Krivci","Bodljikava žica","Anđeo osvete","Matador","Srdžba Montoya","Urota protiv Custera","Velike prerije","Little Bighorn","Crna smrt","Maska užasa","Bubnjevi u šumi","Velika invazija","Rat na granici","Junaci Teksasa","Ljudi u bekstvu","Mefisto!","Zamka za Karsona","Moć tame","Jazbina zla","Rat u pustinji","Rendžer je izdajnik!","Francuski trgovac","Snejk Bil","U neprijateljskom logoru","Povratak u Kalver siti","Grad straha","Šume Oregona","Šenonove puške","Dug put","Kripta","Pernata zmija","Kiša","Madi krik","Zaseda u ponoć","Kajove","Lovci na bizone","Crveni vukovi","Dvojica neprijatelja","Pravda na granici","Braća Domegan","Obeležje moći","Indijanska dijadema","Sveto mesto","Jezero Atabska","Rečni pljačkaši","Golden Erou","Mesto Blokade","Dolina mržnje","Udarac za udarac","Neumoljivi Tumak","Anasazi","Kolorado Bel","Banditi iz grada duhova","Đavolja vrata","Blago iz rudnika","Beli brat","Sramna ucena","Nameštaljka u Klondajku","Potera po velikom severu","Poslednja diližansa","Napušteni put","Dokazivanje optužnice","Vojni sud","Voz za Redvil","Blokirani put","Selo pod opsadom","Pucanj u metu","Tročlana banda","Tajanstveni ubica","Smrt u magli","Ubijte Kita Vilera!","Bekstvo","Odbrojani minuti","Moktezuma!","Prljavi novac","Peščani zdenac","Buffalo soldiers","Deseta konjanička","Opsada Uta","Begunac","Prokleta zemlja","Tornado","Staza uspomena","Ubojstvo u ulici Burbon","Ponoćni starac","Alkemičareva kuća","Montalesova osveta","Zvona San Rafaela","Indijanski šerif","Ljudska lovina","Missouri","Dva gerilca","Velika žeđ","Igre moći","Tigrova pandža","Crni zamak","Pobuna Cheyennea","Tri duga dana","Čovjek iz Baltimorea","Isprepletene sudbine","Mrtvačeva ruka","Podnevni vlak","Deadwood","S onu stranu rijeke","Kameni most","Vatreno krštenje","Odmetnuti rendžer","Demoni sjevera","Osvetnici iz Veagasa","Obračun kod korala","Ćovjek bez lica","Napad na diližansu",]
    private static let dates_texWiller: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_texWiller: [String:Int] = [ "001":43,"002":103,"003":80,"004":156,"005":97,"006":119,"007":84,"008":95,"009":65,"010":128,"011":99,"012":129,"013":129,"014":76,"015":129,"016":76,"017":82,"018":85,"019":92,"020":84,"021":89,"022":87,"023":76,"024":108,"026":97,"027":84,"028":129,"029":98,"030":81,"031":98,"032":130,"033":83,"034":80,"035":129,"036":97,"037":99,"038":108,"040":119,"041":85,"042":85,"043":97,"044":88,"045":115,"046":121,"047":63,"048":94,"049":100,"050":105,"051":98,"052":97,"053":93,"054":112,"055":76,"056":76,"057":93,"058":92,"059":93,"060":85,"061":93,"062":86,"063":89,"064":92,"065":93,"066":92,"067":60,"068":87,"069":71,"070":92,"071":78,"072":76,"073":82,"074":93,"075":74,"076":67,"077":69,"078":82,"079":82,"080":68,"081":81,"082":94,"083":95,"084":94,"085":93,"086":95,"087":93,"088":74,"089":73,"090":70,"091":126,"092":69,"093":87,"094":50,"095":91,"096":55,"097":83,"098":80,"099":47,"101":91,"102":94,"103":44,"104":95,"105":95,"106":94,"107":93,"108":91,"109":78,"110":111,"111":111,"112":82,"113":45,"114":96,"116":87,"117":86,"118":95,"119":63,"120":95,"121":111,"122":111,"125":111,"126":111,"127":111,"128":32,"129":80,"130":111,"131":81,"132":72,"133":94,"134":52,"135":74,"136":71,"137":93,"138":86,"139":88,"140":97,"143":135,"144":126,"145":113,"146":95,"147":95,"148":95,"149":94,"150":114,"151":121,"152":143,"154":130,"155":107,"156":97,"157":104,"158":133,"159":143,"160":77,"161":76,"162":82,"163":111,"164":112,"165":111,"166":112,"167":140,"168":82,"169":112,"170":111,"171":112,"172":111,"173":111,"174":143,"175":79,"176":111,"177":111,"178":140,"179":81,"180":65,"181":92,"182":91,"183":97,"184":111,"185":111,"186":111,"187":111,"188":111,"189":111,"190":111,"191":111,"192":123,"193":99,"194":111,"195":111,"196":112,"197":111,"198":124,"199":98,"200":111,"201":111,"202":111,"203":111,"204":111,"205":111,"206":134,"207":88,"208":111,"209":112,"210":111,"211":95,"212":80,"213":95,"214":147,"215":75,"216":111,"217":111,"218":111,"219":112,"220":111,"221":111,"222":111,"223":111,"224":111,"225":126,"226":96,"227":111,"228":111,"229":111,"230":111,"231":111,"232":111,"233":111,"234":111,"235":111,"236":111,"237":111,"238":111,"239":111,"240":111,"241":111,"242":111,"243":111,"244":111,"245":111,"246":111,"247":111,"248":113,"249":113,"250":113,"251":113,"252":113,"253":113,"254":86,"255":113,"256":114,"257":101,"258":115,"259":113,"260":141,"261":86,"262":117,"263":115,"264":154,"265":76,"266":115,"267":115,"268":114,"269":115,"270":116,"271":75,"277":95,"278":95,"279":92,"280":94,"281":63,"282":93,"283":61,"284":95,"285":95,"286":94,"287":64,"288":92,"289":94,"290":92,"291":95,"292":92,"293":71,"294":89,"295":94,"296":67,"297":94,"298":88,"299":80,"300":111,"301":93,"302":83,"303":95,"304":67,"305":95,"306":95,"307":95,"308":95,"309":93,"310":93,"311":83,"312":45,"313":94,"314":73,"315":93,"316":47,"317":53,"318":94,"319":95,"320":95,"321":62,"322":94,"323":95,"324":95,"325":92,"326":92,"327":95,"328":95,"329":94,"330":94,"331":93,"332":93,"333":58,"334":95,"335":94,"336":95,"337":94,"338":95,"339":55,"340":53,"341":63,"342":94,"343":80,"344":94,"345":94,"346":77,"347":95,"348":94,"349":94,"350":95,"351":54,"352":94,"353":53,"354":96,"355":112,"356":147,"365":111,"366":143,"367":79,"368":111,"369":65,"370":111,"371":111,"372":111,"373":111,"374":111,"375":111,"376":112,"377":111,"378":111,"379":111,"380":111,"381":111,"382":144,"383":112,"384":112,"385":112,"386":112,"387":112,"388":112,"389":111,"390":112,"391":112,"392":112,"393":112,"394":112,"395":111,"396":111,"397":112,"398":112,"399":112,"400":112,"401":111,"402":111,"403":112,"404":111,"405":111,"406":113,"407":113,"408":113,"409":113,"410":112,"411":113,"412":113,"413":112,"414":112,"415":113,"416":114,"417":114,"418":114,"419":113,"420":114,"421":96,"422":95,"423":96,"425":96,"427":112,"428":111,"429":112,"430":112,"431":112,"432":112,"433":111,"434":111,"435":111,"436":112,"437":112,"438":111,"439":111,"440":112,"441":112,"442":111,"443":111,"444":111,"445":112,"446":111,"447":112,"448":112,"449":112,"452":112,"453":112,"454":112,"455":113,"456":113,"457":112,"458":113,"459":112,"460":112,"461":113,"462":112,"463":112,"464":112,"465":113,"466":113,"467":113,"468":112,"469":113,"470":113,"471":113,"472":113,"473":113,"474":113,"475":113,"476":112,"477":113,"478":113,"479":111,"480":112,"481":113,"482":112,"483":113,"484":113,"486":114,"487":114,"488":113,"489":113,"490":112,"491":114,"492":113,"493":111,"494":112,"496":113,"497":113,"498":113,"499":113,"500":112,"501":112,"502":112,"503":112,"504":112,"505":112,"507":112,"508":111,"509":111,"510":112,"511":112,"512":112,"513":112,"514":111,"515":111,"516":111,"517":111,"518":112,"519":111,"520":112,"521":111,"522":112,"523":112,"524":112,"525":112,"526":112,"527":112,"528":112,"529":112,"530":112,"531":112,"532":111,"533":112,"534":112,"535":114,"536":114,"537":114,"538":115,"539":115,"540":114,"541":115,"542":116,"543":114,"544":114,"545":114,"546":115,"547":115,"548":115,"549":114,"550":115,"551":116,"552":117,"553":115,"554":117,"555":117,"556":117,"557":117,"558":117,"559":117,"560":117,"561":117,"562":117,"569":112,"570":112,"571":114,"572":113,"573":113,"574":113,"575":114,"576":113,"577":113,"578":113,"579":113,"580":113,"581":113,"582":113,"583":113,"584":113,"585":112,"586":112,"587":114,"588":114,"589":115,"590":115,"591":115,"592":115,"593":115,"594":115,"595":115,"596":115,"597":118,"598":115,"599":118,"600":120,"601":115,"602":115,"603":120,"604":115,]
    // =====talicniTom=====
    private static let numbers_talicniTom: [String] = ["001","002","003","004","005","006","007","008","009","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","034","035","036","037","038","039","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070","071","072",]
    private static let titles_talicniTom: [String] = ["Diggerov rudnik zlata","Rodeo","Arizona","Avanture na zapadu","Protiv Pata Pokera","Pakao u Oklahomi","Eliksir dr. Doksija","Fil Defer, zvani 'Dugonja'","Pruga kroz preriju","Protiv Džosa Džambasa","Talični Tom i braća Dalton","Sudija Roj Bin","Put za Oklahomu","Bekstvo Daltonovih","Na Misisipiju","Na tragu braće Dalton","U znaku petroleja","Rat dugonosih","Bili Kid","Put u Vajoming","Daltoni u Kanadi","Daltoni ponovo jašu","Karavan","Grad duhova","Daltoni ponovo jašu","Dvadeseti konjički puk","Pratnja","Ograda u preriji","Kalamiti Džejn","Braća Dalton u Meksiku","Diližansa","Junak mlakonja","Dalton city","Protiv Džesi Džemsa","Western circus","Kanjon Apacha","Mama Dalton","Lovac na ucene","Specijalni gosti","Lajavkovo nasledstvo","7 avantura Taličnog Toma","Beli konjanik","Poseban tretman","Američki car","Žica koja peva","Zakopano blago","Jednoruki bandit","Sara Bernar","Uže za vješanje i druge priče","Kako se spasio Beligrad","Čarobni prsti","Daily star","Lepe žene putuju na zapad","Balada o Daltonima i druge priče","Ukleti ranč","Nitroglicerin","Alibi i ostale priče","Poni express","Daltoni gube pamćenje","Lov na duhove","Braća Dalton na vjenčanju","Most na Misisipiju","Bela Star","Klondike","O.K. Corral","Marcel Dalton","Prorok","Slikar","Legenda zapada","Lijepa provincija","Uže oko vrata",]
    private static let dates_talicniTom: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_talicniTom: [String:Int] = [ "001":47,"002":58,"003":40,"004":46,"005":45,"006":45,"007":45,"008":45,"009":45,"011":44,"012":45,"013":45,"014":45,"015":45,"016":45,"017":45,"018":45,"019":45,"020":45,"021":45,"022":45,"023":45,"024":45,"025":45,"026":45,"027":45,"028":45,"029":45,"030":45,"031":45,"032":44,"033":45,"034":45,"035":45,"036":45,"037":45,"038":45,"039":45,"040":45,"041":45,"042":43,"043":45,"044":45,"045":45,"046":45,"047":45,"048":45,"049":45,"050":46,"051":45,"052":45,"053":45,"054":45,"055":47,"056":45,"057":45,"058":45,"059":45,"060":45,"061":45,"062":45,"063":45,"064":45,"065":45,"066":45,"067":45,"068":45,"069":45,"070":45,"071":45,"072":45,]
    // =====blek=====
    private static let numbers_blek: [String] = ["001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","034","035","036","037","038","039","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","060","061","062","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080","081","082","083","085","086","087","088","089","090","091","092","093","094","095","096","097","098","099","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220",]
    private static let titles_blek: [String] = ["Bostonski misterij","Vodena neman","Most u vazduhu","Klejtonovi gusari","Podvala","Čegrtuša i Largo","Lažni traperi","Na tragu Vanakisa","Tajanstveni Levre","Blago zelenih močvara","Crni jahači","Grad bez sunca","Lažni prorok","Jama prokletih","Ostrvo crnih vitezova","Proba hrabrosti","Totem Murak","Čudovište nad Bostonom","Duh iz Kastlmora","Žaoka","Blago Manitua","Ko je kidnapovao Rodija?","Jedrenjak Lafajet","Imperator Vulkane","Veliki Blek","Sinovi šume","Jezero lešinara","Pobuna robova","Čovek s bičem","Juriš trapera","Zov bubnjeva","Lažni Blek","Tragičan lov","Prokleta kula","Mač ima reč","Vitez od Sezana","Voštane figure","Ledena skela","Atentat u Portlendu","Maskirani osvetnik","Usplamtelo more","Kandže Algonkina","Hrabri saveznici","Lukava markiza","Rodijev podvig","Tetovirana šifra","Blek u mišolovci","Bunar smrti","Otmica na gubilištu","Teror u Spartonu","Blekova pravda","Tajna veza","Treći čovek","Zavera ćutanja","Zarobljenici aligatora","Tri samuraja","Krik sove","Traperova reč","Ponor prokletih","Rat ugnjetačima","Zaliv ajkula","Brzi jelen","Beli indijanac","Braća Lister","Vladarka močvare","Jednoruki Kuka","Lavovi Kamura","Usamljenik Zukor","Saska Tan","Opasna devojka","Poglavica Pajuta","Rođaka Eufrazija","Tri zlatna metka","Jaguar sedam mora","Astronom Džeremija","Izaslanik Spenser","Ratna sekira","Garlandov bič","Dolina totema","Smotra straže","Osumnjičeni Blek","Rodi u akciji","Plava pećina","Nepogrešivi strelac","Eskimski logor","Blek zarobljenik","Okultis verenik","Uzbudljivo venčanje","Smeli korak","Kćerka trapera","Bengalska vatra","Špijun","Sjene u šumi","Pobuna Triksovih","Dvostruka igra","Ciganski pergament","Zasjeda na crvenoj rijeci","Putovanje u tamu","Na rubu oštrice","Zmijsko jezero","Kula duhova","Gusarsko blago","Život za život","Zarobljenici plemena Seneka","Strelica Delawarea","Tajna poruka","Majmun lopov","Tajna Allodole","Blek u Londonu","Od Londona do Škotske","Ekspedicija Mensfild","Zdenac smrti","Besmrtni bizon","Plan očajnika","Mumija iz Bar Galča","Grad čarolija","U praskozorje","Saratoga","Izdajnik Vejk Lenda","Arhipelag gusara","Priča o Velikom Bleku","Zlatna munja","Okultisova ruža","Sedam dijamanata","Kod Tri hrasta","Škotlanđani dolaze","Gusari kapetana Skuma","Pepeo Minga","Rodojevi otmičari","Plemeniti spasilac","Sabotaža u luci","Novogodišnja noć","Zajedljivi mister Iks","Najduža noć","Svadbeno veselje","Bravo, Blek!","Zatočenica močvare","Uhoda","Operacija 'Opera'","Agent B 23","Rodijeva pobeda","Dve napasti","Noć užasa","Presuda bez milosti","Druga strana medalje","Izgubljeni trag","Divlja mačka","Lažni rodoljubi","Pakleno ostrvo","Gužva u Bostonu","Gvozdeno lice","Bela indijanka","Rodijev neprijatelj","Finova tajna","Dvostruka igra","Izdaja","Bekstvo","Istina o Bleku","Blago Čavkaša","Uzbuna u Abervilu","Strela Delavara","Velika zavera","Osujećen prepad","Ljubomorni kapetan","Tajanstveni lovac","Mala šapa","Otava-Te","Dedhed","Fort Kiler","Osmatračnice u plamenu","Uzbuna u plemenu","Medveđa posla","Rodijevi doživljaji - Večera","Vatrena zamka","Atentat","Veliki talas","Đavolji učenik","Dvostruka igra","Bostonski fantom","Gusarsko blago","Povratak iz Brokvila","Trka za nevestom","Svi protiv Bleka","Doseljenici","Dvostruki špijun","Dugotrajni dvoboj","Poručnik Dejzi","Steline avanture","Topovi za rodoljube","Crni panter","Izgubljeni puk","Kraljevstvo rogatih","Blekov dug","Zatvorenik severne kule","Kula smrti","Naslednica","Robovi","Blek sređuje račune","Dve napasti","Skriveno blago","Legenda o plavom varvarinu","Crni sombrero","Plavi uvojci","Kameno srce","Užarene oči","Tajna majora Finča","Lov","Zov bubnjeva","Lažni Blek","Tragičan lov","Prokleta kula","Mač ima reč","Vitez od Sezana","Kavanahova zavera","Liga pravde","Blago kapetana Kida","Na zlatnom tragu","Balon",]
    private static let dates_blek: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",]
    private static let nposPage_blek: [String:Int] = [ "001":227,"002":76,"003":76,"004":76,"005":76,"006":61,"007":61,"008":228,"009":74,"010":64,"011":61,"012":76,"013":93,"014":76,"015":61,"016":76,"017":56,"018":76,"019":76,"020":76,"021":73,"022":76,"023":76,"024":76,"025":129,"026":128,"027":129,"028":129,"029":129,"030":65,"031":97,"032":97,"033":97,"034":97,"035":97,"036":97,"037":97,"038":97,"039":97,"040":97,"041":97,"042":97,"043":97,"044":97,"045":97,"046":97,"047":97,"048":97,"049":97,"050":97,"051":97,"052":97,"053":97,"054":97,"055":97,"056":97,"057":113,"058":112,"060":76,"061":113,"062":113,"063":113,"064":113,"065":113,"066":113,"067":113,"068":113,"069":113,"070":113,"071":113,"072":112,"073":110,"074":104,"075":110,"076":113,"077":109,"078":109,"079":111,"080":102,"081":110,"082":110,"083":106,"085":106,"086":106,"087":106,"088":106,"089":106,"090":106,"091":106,"092":87,"093":87,"094":223,"095":223,"096":191,"097":191,"098":191,"099":223,"100":207,"101":201,"102":185,"103":185,"104":185,"105":185,"106":187,"107":192,"108":183,"109":190,"110":192,"111":56,"112":56,"113":56,"114":55,"115":74,"116":56,"117":56,"118":76,"119":56,"120":76,"121":76,"122":76,"123":76,"124":76,"125":76,"126":76,"127":76,"128":75,"129":76,"130":76,"131":76,"132":76,"133":76,"134":76,"135":75,"136":76,"137":76,"138":75,"139":76,"140":76,"141":76,"142":76,"143":76,"144":76,"145":13,"146":13,"147":13,"148":13,"149":13,"150":61,"151":61,"152":65,"153":61,"154":35,"155":36,"156":36,"157":36,"158":36,"159":36,"160":36,"161":36,"162":36,"163":36,"164":36,"165":36,"166":47,"167":13,"168":13,"169":13,"170":13,"171":13,"172":30,"173":47,"174":13,"175":6,"176":61,"177":61,"178":61,"179":61,"180":51,"181":96,"182":93,"183":93,"184":61,"185":73,"186":61,"187":76,"188":61,"189":61,"190":61,"191":61,"192":61,"193":76,"194":61,"195":76,"196":76,"197":61,"198":76,"199":61,"200":61,"201":76,"202":76,"203":61,"204":61,"205":61,"206":61,"207":61,"208":61,"209":61,"210":95,"211":95,"212":94,"213":94,"214":94,"215":94,"216":61,"217":61,"218":61,"219":61,"220":61,]

    private static let numbers_misterNo: [String] = ["001","004","005","006","007","008","009","010","011","012","013","014","015","017","019","018","020","021","022","023","024","025","026","027","028","029","030","031","033","034","035","036","037","038","039","040","042","043","046","047","048","049","050","051","053","055","056","057","058","059","060","061","062","063","065","066","067","068","069","070","072","073","074","076","077","078","079","080","081","082","084","085","086","087","088","089","091","092","093","094","095","096","097","098","099","100","101","102","103","105","106","107","108","109","110","112","113","114","115","116","117","118","119","120","121","123","124","125","127","128","129","130","131","132","133","134","136","137","138","139","140","141","143","144","145","146","147","148","149","150","152","153","154","155","156","157","158","159","161","162","163","164","165","167","168","169","170","171","172","174","175","177","178","179","181","182","183","185","186","187","188","189","191","192","193","194","195","197","198","200","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","275","276","277","278","279","280","281","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","345","346","347","348","349","350","351","352","353","354","355","356","357","358","359","360","361","364","365","366","367","368","369","370","371","372","373","374","375","376","377","378","379"]

    private static let titles_misterNo: [String] = ["Dijamantska klopka","Poslednji Kangačeiro","Presuda Fonseku","U čeljusti jaguara","Bubnjevi u džungli","Gusari Amazona","Čovek s maskom","Zaseda u močvari","Zla kob","Usijanje","Crna reka","Senke u noći","Prokletstvo Maja","Tajni agent","Zlokobna močvara","Operacija 'Posejdon'","Bekstvo","Velika pljačka","Mambo, Mambo ...","Operacija 'Pajper'","Drama u zalivu","Hangadeirosi","Hulja","Zlatna čerbatana","Dijamanti","Tajanstveni grad","Bandit","El Loko","Zov Agvanura","Utvara jaguar","Crna kandža","Probodena džungla","Surova zemlja","Plaćenik","U krugu smrti","Dvostruka ucena","Čudo neviđeno","U zemlji Morosa","Pobuna","Eldorado","Lešinari","Tragični susret","Špijunska mreža","Tovar B-24","Prokleti most","Nestali avion","Smrtonosni tovar","Hodnik za pakao","Zakon osvete","Bekstvo sa Kajene","Rongo-Rongo","Znak moći","Tangata-manu","Janoama","Plavi đavo","Crno zlato","Čovek iz Akapulka","Žigosan kao ubica","Gaučo Ramon","Pazi, Snima se!","Leteći đavoli","Krvavi sneg","Pakleni plan","Mafija ne prašta","Umreti na Kapriju","Strah na Karibima","Zarobljeni na dnu","Nemoguće bekstvo","Dečak Santjago","Mupuku i jaguar","Dvoboj na nebu","Begunci","Licem u lice","Sukob u suton","Grad zločina","Gangsteri","Ananga","Duh zla","Ledeni pakao","Bijeli užas","Izgubljena utvrda","Ukleta kula","Fantom u operi","Tajni prolaz","Čovjek koji je previše znao","Džungla","Mesečeve planine","Zlatni kavez","Tajna Atakame","Crvene senke","Vestern Džona Trevora","Vatreno popodne","UFO","Čovek iz svemira","Kralj džungle","Karipune","Noć u Trinidadu","U vodama Kariba","Vrh u magli","Smaragdi","Prorok","Paukova mreža","Streljački vod","Pilot uragana","Lov na mikrofilm","Plamen mržnje","Obaveštajac","Zona Rio Uruku","Zmajevi sa Komoda","Sera Kobras","Kavasaki-56","Saslušanje","Samoubilački napad","Etrurski demon","Baukova usta","Otrovna strela","Bez milosti","Put u smrt","Noć čudovišta","Čarobnjak Hel","Dobrodošlica u Trinidadu","Surat kan","Iščezla ekspedicija","Biljke ubice","Vazdušni gusar","Leteći tigrovi","Žuto nebo","Samuraj Saiko","Noć Mačeta","Kuća Bogova","Gospodarica tajne","Ubica iz senke","Krunski svedok","Dvoboj na Pantanalu","Vrata pakla","Obmana","Avet sa Rio Kujabe","Osveta kapetana Teksejre","Bezimeni protivnik","Verakruz","Apolonijino prokletstvo","Žrtveni zdenac","Putnica bez prtljaga","Afrika","Safari","Ritualne maske","Čuvari divljine","Braća po krvi","Kraljevstvo Fanga","Planina lobanja","Pirati iz Gvineje","Najrobi autostop","Trgovci slonovačom","Pobuna Masaja","Mau-Mau","Oluja nad Kenijom","Vrač Kikujua","Al Azif","Zaboravljeni faraon","Lavirint opsena","Sahara","Groblje kamenih zmija","Legionari","Bogovi okruglih glava","Fort Motilinski","Blago afričkog korpusa","Dvojica protiv svih","Muzika maestro!","Pesma očajnika","Sedmorica sa 'Santa Cruza'","Posljednje oružje","Sotonski znakovi","Gospodar mraka","Pokolj","Indijanski ratnik","Bez milosti","Smrtne osude","Nesreća u prašumi","Preživjeli","Ledena tamnica","Povratak 'Tigrova'","Zlatni trokut","Legenda o Butchu Cassidyju","Patagonija","Kolumbijac","Dvoje na meti","Štovatelji zla","Barun Samedi","'Casablanca cafe'","Dubine","Zatrovana laguna","Prvak","Otmičari","Ratni zarobljenik","Heroji bez slave","Ludo smioni","Matador","Fiesta smrti","Očajnički sati","Ninja!","Čovjek bez prošlosti","Istraga visoka rizika","Zločinački mozaik","Unakrsna vatra","Zaboravljeni grad","Kamena zamka","Projekt 'Pegaz'","Primitivan narod","Dan lešinara","Crveni vjetar","Morski psi","Junačka krv","Otok izgubljenih dana","Opasne igre","Bijeg iz pakla","Tajna kripte","Stranac u Redencionu","Zemlja bezakonja","Granica","Čudovište iz močvare","Vatreni uragan","Pasji dan","Dark city","Sjeme mržnje","Presuda","Iza maske","Povratak u New York","Neprijateljeva sjena","Opasne vode","Vreme nasilja","Ljudi bez nade","Samoubilačka misija","Šuma tajni","Beli indijanac","Krv ratnika","Dvadeset godina kasnije","Zemlja i sloboda","Izdajnik","Poslednja granica","Lovci i lovina","Užas u džungli","Serijski ubica","Pobuna","Pod znakom avanture","Gvadal kanal!","Godišnje doba u paklu","Na tragu gospodina Kaplana","Oči u tami","Na ivici ambisa","Noć žrtvovanja","Pobunjenik Huanito","Odblesci bitke","Nemilosrdni lov","Prijatelj u opasnosti","Gringov izazov","Teror Rio Negra","U piratskoj jazbini","Smrt u Manausu","Senka škorpiona","Osuđenici iz rudnika","Opsada","Avantura na Kordiljerima","Dva života u igri","Prokleta reka","Teritorija Hivaroa","Vruća fotografija","Pravac Los Anđeles","Atentat","Spletke na vrhu","Crna berza smrti","Indokina","Staza uspomena","Buđenje zmaja","Krvavi tragovi","Poslednje vatre","Tajanstvena Burma","Zabranjeni hram","Atomska uzbuna","Rat špijuna","U kineskim morima","Makao","Cena izdaje","Progonjeni","Predskazanja smrti","Pobednici i pobeđeni","Rio de Žaneiro","Ukradeni pajper","Priča o vojniku","Ljudi i heroji","Vreme ubica","Osveta!","Ujed pirane","Oteta devojka","U srcu džungle","Majanski idol","Pravda Janoama","Krv u raju","Prljavi novac","Trka s vremenom","Čovek iz budućnosti","Pokajnik","Zamka za miševe","Blago Saint-Exuperya","Pretnja prošlosti","Nešto se promenilo","Neobičan susret","Vatra i krv","Ajauaska","Delirijum","Zaseda na 'Viktoriji'","Lepa gomila kruzeira","Šuma u plamenu","Krugerov izazov","Empate","Zabava je završena","Misija Majari","U potrazi za Kamanauom","Crvena stena","Crna laguna","Novi život"
    ]
    private static let dates_misterNo: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    private static let nposPage_misterNo: [String:Int] = ["001":93,"004":94,"005":93,"006":93,"007":83,"008":95,"009":93,"010":93,"011":95,"012":95,"013":94,"014":95,"015":94,"017":95,"019":93,"018":93,"020":91,"021":95,"022":81,"023":94,"024":90,"025":90,"026":81,"027":95,"028":95,"029":85,"030":65,"031":63,"033":45,"034":95,"035":95,"036":89,"037":68,"038":92,"039":89,"040":92,"042":48,"043":89,"046":61,"047":94,"048":95,"049":79,"050":87,"051":50,"053":46,"055":83,"056":69,"057":95,"058":95,"059":91,"060":95,"061":94,"062":95,"063":93,"065":93,"066":92,"067":59,"068":91,"069":75,"070":91,"072":91,"073":82,"074":46,"076":93,"077":92,"078":90,"079":93,"080":62,"081":93,"082":94,"084":91,"085":92,"086":62,"087":91,"088":89,"089":92,"091":94,"092":97,"093":98,"094":98,"095":98,"096":98,"097":98,"098":100,"099":99,"100":95,"101":95,"102":85,"103":92,"105":88,"106":85,"107":48,"108":93,"109":94,"110":92,"112":75,"113":91,"114":92,"115":92,"116":43,"117":97,"118":97,"119":100,"120":90,"121":76,"123":46,"124":95,"125":95,"127":65,"128":94,"129":94,"130":75,"131":91,"132":94,"133":73,"134":90,"136":94,"137":93,"138":93,"139":46,"140":92,"141":93,"143":95,"144":93,"145":93,"146":94,"147":93,"148":65,"149":94,"150":94,"152":92,"153":94,"154":37,"155":94,"156":94,"157":94,"158":94,"159":42,"161":51,"162":94,"163":94,"164":70,"165":94,"167":94,"168":94,"169":79,"170":93,"171":93,"172":81,"174":95,"175":94,"177":94,"178":94,"179":53,"181":94,"182":94,"183":94,"185":94,"186":52,"187":55,"188":94,"189":94,"191":95,"192":94,"193":44,"194":93,"195":94,"197":61,"198":60,"200":112,"202":95,"203":95,"204":95,"205":95,"206":95,"207":95,"208":87,"209":95,"210":95,"211":95,"212":95,"213":95,"214":95,"215":95,"216":95,"217":95,"218":95,"219":95,"220":95,"221":95,"222":95,"223":95,"224":95,"225":95,"226":95,"227":95,"228":95,"229":95,"230":95,"231":95,"232":95,"233":95,"234":95,"235":95,"236":95,"237":95,"238":95,"239":95,"240":95,"241":95,"242":95,"243":95,"244":95,"245":95,"246":95,"247":95,"248":95,"249":95,"250":95,"251":95,"252":95,"253":95,"254":95,"255":95,"256":95,"257":95,"258":95,"259":95,"275":95,"276":95,"277":95,"278":95,"279":95,"280":95,"281":95,"292":95,"293":95,"294":95,"295":95,"296":95,"297":95,"298":95,"299":95,"300":95,"301":95,"302":95,"303":95,"304":95,"305":95,"306":95,"307":95,"308":93,"309":95,"310":95,"311":95,"312":95,"313":95,"314":95,"315":95,"316":95,"317":95,"318":95,"319":95,"320":95,"321":95,"322":95,"323":95,"324":95,"325":95,"326":95,"327":95,"328":95,"329":95,"330":95,"331":95,"332":95,"333":95,"334":95,"335":95,"336":95,"337":95,"338":95,"339":95,"340":96,"341":97,"342":98,"343":96,"345":99,"346":100,"347":99,"348":100,"349":100,"350":100,"351":100,"352":99,"353":99,"354":98,"355":98,"356":99,"357":98,"358":98,"359":99,"360":96,"361":95,"364":95,"365":95,"366":97,"367":97,"368":97,"369":97,"370":97,"371":96,"372":96,"373":100,"374":96,"375":96,"376":96,"377":96,"378":96,"379":96]
 
    private static func firstPage(forEpisode episode: Int) -> Int {
        // Za prve strane, od svakog stripa koji ima x strane uzmem poslednju i onda +1
        // for f in $(ls); do echo $f; find $f -name \*x.\* | sort | sed -e 's|.*/||' | sed -e 's/_.*//' | sort -u > $f/numbers; for n in $(cat $f/numbers); do find $f -name \*x.\* | sort | grep -vE "(_1|_0[1-9])" | grep ${n}_ | sort | tail -n 1 | sed -e 's|.*/||' | sed -r 's/([0-9]+)_00([1-5])x.(jpg|png)/case "\1": return \2+1/'; done; done

        // Za npos strane, od svakog stripa koji ima x strane oko kraja, uzmem prvu:
        // for f in $(ls); do echo $f; find $f -name \*x.\* | sort | sed -e 's|.*/||' | sed -e 's/_.*//' | sort -u > $f/numbers; for n in $(cat $f/numbers); do find $f -name \*x.\* | grep -E "(_1|_0[1-9])" | grep $n_ | sort | head -n 1 | sed -e 's|.*/||' | sed -r 's/([0-9]+)_([0-9]+)x.(jpg|png)/"\1":\2,/'; done; done
        let index = flavorIndex(forEpisode: episode)
        switch sectionInfo[index.0].2 {
        case "alanford":
            return 1
        case "misterno":
            switch numbers[episode] {
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
        case "zagor":
            switch numbers[episode] {
            case "001": return 1+1
            case "002": return 2+1
            case "003": return 1+1
            case "004": return 1+1
            case "005": return 4+1
            case "006": return 2+1
            case "007": return 2+1
            case "008": return 1+1
            case "009": return 1+1
            case "010": return 1+1
            case "011": return 1+1
            case "012": return 2+1
            case "013": return 2+1
            case "014": return 2+1
            case "015": return 2+1
            case "016": return 2+1
            case "017": return 1+1
            case "018": return 2+1
            case "019": return 1+1
            case "020": return 1+1
            case "021": return 1+1
            case "022": return 2+1
            case "023": return 1+1
            case "024": return 4+1
            case "025": return 1+1
            case "026": return 1+1
            case "027": return 1+1
            case "028": return 1+1
            case "029": return 1+1
            case "030": return 1+1
            case "031": return 1+1
            case "032": return 1+1
            case "033": return 1+1
            case "040": return 1+1
            case "041": return 1+1
            case "042": return 1+1
            case "049": return 1+1
            case "050": return 2+1
            case "081": return 1+1
            case "129": return 1+1
            case "178": return 2+1
            case "179": return 1+1
            case "188": return 1+1
            case "211": return 1+1
            case "261": return 5+1
            case "276": return 1+1
            case "321": return 1+1
            case "322": return 1+1
            case "323": return 1+1
            case "324": return 2+1
            case "325": return 2+1
            case "326": return 2+1
            case "327": return 2+1
            case "375": return 2+1
            case "390": return 1+1
            case "478": return 1+1
            case "519": return 2+1
            case "543": return 1+1
            case "547": return 1+1
            case "548": return 1+1
            case "549": return 1+1
            case "550": return 1+1
            case "551": return 1+1
            case "552": return 1+1
            case "553": return 1+1
            case "554": return 1+1
            case "555": return 1+1
            case "556": return 1+1
            case "557": return 2+1
            case "558": return 4+1
            case "559": return 4+1
            case "560": return 3+1
            case "561": return 3+1
            case "562": return 2+1
            case "563": return 3+1
            case "564": return 2+1
            case "565": return 2+1
            case "566": return 3+1
            case "567": return 2+1
            case "568": return 2+1
            case "569": return 2+1
            case "570": return 2+1
            case "571": return 2+1
            case "572": return 2+1
            case "573": return 2+1
            case "574": return 2+1
            case "575": return 3+1
            case "576": return 2+1
            case "577": return 2+1
            case "578": return 2+1
            case "579": return 1+1
            case "580": return 2+1
            case "581": return 1+1
            case "582": return 1+1
            case "583": return 1+1
            case "584": return 1+1
            case "585": return 1+1
            case "586": return 1+1
            case "589": return 1+1
            case "590": return 1+1
            case "591": return 1+1
            case "592": return 1+1
            case "593": return 1+1
            case "595": return 1+1
            case "596": return 1+1
            case "597": return 1+1
            case "598": return 1+1
            case "599": return 1+1
            case "600": return 1+1
            case "601": return 1+1
            case "602": return 1+1
            case "603": return 1+1
            case "604": return 1+1
            case "605": return 1+1
            case "606": return 1+1
            case "607": return 1+1
            case "608": return 1+1
            case "609": return 1+1
            case "610": return 1+1
            case "611": return 1+1
            case "612": return 1+1
            case "613": return 1+1
            case "614": return 1+1
            case "615": return 1+1
            case "616": return 1+1
            case "617": return 1+1
            case "618": return 1+1
            case "619": return 1+1
            case "620": return 1+1
            case "621": return 1+1
            case "622": return 1+1
            case "623": return 1+1
            case "624": return 1+1
            case "625": return 1+1
            case "626": return 1+1
            case "627": return 1+1
            case "628": return 1+1
            case "629": return 1+1
            case "630": return 1+1
            case "631": return 1+1
            case "632": return 1+1
            case "633": return 1+1
            case "634": return 1+1
            case "635": return 1+1
            case "636": return 1+1
            case "637": return 1+1
            default: return 1
            }
        case "blek":
            switch numbers[episode] {
            default: return 1
            }
        case "dylandog":
            switch numbers[episode] {
            case "209": return 1+1
            case "229": return 2+1
            case "277": return 1+1
            case "288": return 1+1
            case "289": return 1+1
            case "291": return 1+1
            case "293": return 1+1
            case "294": return 1+1
            case "295": return 1+1
            case "296": return 1+1
            case "297": return 1+1
            case "303": return 1+1
            case "304": return 1+1
            case "305": return 1+1
            case "308": return 1+1
            case "312": return 1+1
            case "313": return 1+1
            case "314": return 1+1
            case "315": return 1+1
            case "316": return 1+1
            case "317": return 2+1
            case "318": return 2+1
            case "319": return 1+1
            case "320": return 2+1
            case "321": return 1+1
            case "322": return 1+1
            case "323": return 1+1
            case "324": return 1+1
            case "325": return 1+1
            case "326": return 1+1
            case "327": return 1+1
            case "328": return 1+1
            case "329": return 1+1
            case "330": return 3+1
            case "335": return 2+1
            case "340": return 1+1
            case "345": return 1+1
            case "346": return 1+1
            case "347": return 1+1
            case "348": return 1+1
            case "349": return 1+1
            case "350": return 1+1
            default: return 1
            }
        case "texwiller":
            switch numbers[episode] {
            case "209": return 1+1
            case "219": return 1+1
            case "248": return 1+1
            case "249": return 1+1
            case "250": return 1+1
            case "251": return 1+1
            case "252": return 1+1
            case "253": return 1+1
            case "254": return 1+1
            case "255": return 1+1
            case "256": return 1+1
            case "257": return 1+1
            case "258": return 1+1
            case "259": return 1+1
            case "260": return 1+1
            case "261": return 1+1
            case "262": return 1+1
            case "263": return 1+1
            case "264": return 1+1
            case "265": return 1+1
            case "266": return 1+1
            case "267": return 1+1
            case "268": return 1+1
            case "269": return 1+1
            case "270": return 1+1
            case "271": return 1+1
            case "354": return 1+1
            case "376": return 1+1
            case "382": return 1+1
            case "383": return 1+1
            case "384": return 1+1
            case "385": return 1+1
            case "386": return 1+1
            case "387": return 1+1
            case "388": return 1+1
            case "389": return 1+1
            case "390": return 1+1
            case "391": return 1+1
            case "392": return 1+1
            case "393": return 1+1
            case "394": return 1+1
            case "397": return 1+1
            case "398": return 1+1
            case "399": return 1+1
            case "400": return 1+1
            case "403": return 1+1
            case "406": return 2+1
            case "407": return 2+1
            case "408": return 2+1
            case "409": return 2+1
            case "410": return 1+1
            case "411": return 2+1
            case "412": return 2+1
            case "413": return 1+1
            case "414": return 2+1
            case "415": return 2+1
            case "416": return 2+1
            case "417": return 2+1
            case "418": return 2+1
            case "419": return 1+1
            case "420": return 2+1
            case "429": return 1+1
            case "430": return 1+1
            case "432": return 1+1
            case "436": return 1+1
            case "437": return 1+1
            case "440": return 1+1
            case "441": return 1+1
            case "445": return 1+1
            case "447": return 1+1
            case "448": return 1+1
            case "449": return 1+1
            case "452": return 1+1
            case "453": return 1+1
            case "454": return 1+1
            case "455": return 2+1
            case "456": return 2+1
            case "457": return 1+1
            case "458": return 1+1
            case "459": return 1+1
            case "460": return 1+1
            case "461": return 2+1
            case "462": return 1+1
            case "463": return 1+1
            case "464": return 1+1
            case "465": return 2+1
            case "466": return 2+1
            case "467": return 2+1
            case "468": return 1+1
            case "469": return 2+1
            case "470": return 2+1
            case "471": return 2+1
            case "472": return 2+1
            case "473": return 2+1
            case "474": return 2+1
            case "475": return 2+1
            case "476": return 1+1
            case "477": return 2+1
            case "478": return 2+1
            case "479": return 1+1
            case "480": return 1+1
            case "481": return 2+1
            case "482": return 1+1
            case "483": return 2+1
            case "484": return 2+1
            case "486": return 3+1
            case "487": return 3+1
            case "488": return 2+1
            case "489": return 1+1
            case "490": return 1+1
            case "491": return 3+1
            case "492": return 2+1
            case "494": return 1+1
            case "496": return 2+1
            case "497": return 2+1
            case "498": return 2+1
            case "499": return 2+1
            case "500": return 1+1
            case "501": return 1+1
            case "502": return 1+1
            case "503": return 1+1
            case "504": return 1+1
            case "505": return 1+1
            case "507": return 1+1
            case "510": return 1+1
            case "511": return 1+1
            case "512": return 1+1
            case "513": return 1+1
            case "518": return 1+1
            case "520": return 1+1
            case "522": return 1+1
            case "523": return 1+1
            case "524": return 1+1
            case "525": return 1+1
            case "526": return 1+1
            case "527": return 1+1
            case "528": return 1+1
            case "529": return 1+1
            case "530": return 1+1
            case "531": return 1+1
            case "533": return 1+1
            case "534": return 1+1
            case "535": return 1+1
            case "536": return 1+1
            case "537": return 1+1
            case "538": return 2+1
            case "539": return 2+1
            case "540": return 1+1
            case "541": return 2+1
            case "542": return 3+1
            case "543": return 1+1
            case "544": return 1+1
            case "545": return 1+1
            case "546": return 2+1
            case "547": return 2+1
            case "548": return 2+1
            case "549": return 1+1
            case "550": return 1+1
            case "551": return 2+1
            case "552": return 3+1
            case "553": return 1+1
            case "554": return 1+1
            case "555": return 1+1
            case "556": return 2+1
            case "557": return 2+1
            case "558": return 1+1
            case "559": return 1+1
            case "560": return 1+1
            case "561": return 1+1
            case "562": return 1+1
            case "569": return 1+1
            case "571": return 1+1
            case "572": return 1+1
            case "573": return 1+1
            case "574": return 1+1
            case "575": return 1+1
            case "576": return 1+1
            case "577": return 1+1
            case "578": return 1+1
            case "579": return 1+1
            case "580": return 1+1
            case "581": return 1+1
            case "582": return 1+1
            case "583": return 1+1
            case "584": return 1+1
            case "587": return 1+1
            case "588": return 1+1
            case "589": return 1+1
            case "590": return 1+1
            case "591": return 1+1
            case "592": return 1+1
            case "593": return 1+1
            case "594": return 1+1
            case "595": return 1+1
            case "596": return 1+1
            case "597": return 1+1
            case "598": return 1+1
            case "599": return 1+1
            case "600": return 1+1
            case "601": return 1+1
            case "602": return 1+1
            case "603": return 1+1
            case "604": return 1+1
            default: return 1
            }
        case "nathannever":
            switch numbers[episode] {
            case "095": return 1+1
            case "096": return 1+1
            case "097": return 1+1
            case "098": return 1+1
            case "099": return 1+1
            case "116": return 1+1
            case "119": return 1+1
            case "122": return 1+1
            case "125": return 1+1
            case "132": return 1+1
            case "133": return 1+1
            case "134": return 1+1
            case "135": return 1+1
            case "136": return 1+1
            case "137": return 1+1
            case "138": return 1+1
            case "139": return 1+1
            case "140": return 1+1
            case "141": return 3+1
            case "142": return 3+1
            case "143": return 3+1
            case "144": return 2+1
            case "145": return 2+1
            case "146": return 2+1
            case "147": return 2+1
            case "148": return 2+1
            case "149": return 2+1
            case "150": return 2+1
            case "151": return 2+1
            case "152": return 2+1
            case "153": return 2+1
            case "154": return 2+1
            case "155": return 2+1
            case "156": return 1+1
            case "157": return 1+1
            case "158": return 1+1
            case "159": return 1+1
            case "160": return 1+1
            case "161": return 1+1
            case "162": return 1+1
            case "163": return 1+1
            case "164": return 1+1
            default: return 1
            }
        case "komandantmark":
            switch numbers[episode] {
            case "007": return 1+1
            case "008": return 1+1
            case "013": return 1+1
            case "016": return 1+1
            case "024": return 1+1
            case "026": return 1+1
            case "027": return 1+1
            case "028": return 1+1
            case "032": return 1+1
            case "035": return 1+1
            case "041": return 1+1
            case "044": return 1+1
            case "049": return 1+1
            case "055": return 1+1
            case "056": return 1+1
            case "059": return 1+1
            case "061": return 1+1
            case "062": return 1+1
            case "067": return 1+1
            case "068": return 1+1
            case "069": return 1+1
            case "070": return 1+1
            case "072": return 1+1
            case "080": return 1+1
            case "081": return 1+1
            case "083": return 1+1
            case "085": return 1+1
            case "087": return 1+1
            case "090": return 1+1
            case "092": return 1+1
            case "101": return 1+1
            case "103": return 1+1
            case "104": return 1+1
            case "108": return 1+1
            case "114": return 1+1
            case "116": return 1+1
            case "121": return 1+1
            case "122": return 1+1
            case "132": return 1+1
            case "134": return 1+1
            case "137": return 1+1
            case "138": return 1+1
            case "140": return 1+1
            case "141": return 1+1
            case "142": return 1+1
            case "146": return 1+1
            case "149": return 1+1
            case "150": return 1+1
            case "151": return 1+1
            default: return 1
            }
        case "ninja":
            switch numbers[episode] {
            default: return 1
            }
        case "strip82":
            switch numbers[episode] {
            default: return 1
            }
        case "talicnitom":
            switch numbers[episode] {
            default: return 1
            }
        case "asterix":
            switch numbers[episode] {
            default: return 1
            }
        case "otkricesveta":
            switch numbers[episode] {
            case "001": return 1+1
            case "002": return 2+1
            case "003": return 1+1
            case "004": return 1+1
            case "005": return 1+1
            case "006": return 1+1
            case "007": return 1+1
            case "008": return 1+1
            case "009": return 1+1
            case "010": return 1+1
            case "011": return 1+1
            case "012": return 2+1
            case "013": return 2+1
            case "014": return 1+1
            case "015": return 1+1
            case "016": return 1+1
            case "017": return 1+1
            case "018": return 1+1
            case "019": return 1+1
            case "020": return 1+1
            default: return 1
            }
        case "druzinaodvjesala":
            switch numbers[episode] {
            case "01": return 4
            case "02"..."15": return 3
            case "18"..."20": return 2
            default: return 1
            }
        default:
            assert(false)
            return 1
        }
    }

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

    static func pages(forEpisode episode: Int) -> [String] {
        let commonExtension = commonPageExtension(forEpisode: episode)
        let index = flavorIndex(forEpisode: episode)
        let number = numbers[episode]
        let bucketSuffix = sectionInfo[index.0].2
        return ["https://yugostrip\(bucketSuffix).fra1.digitaloceanspaces.com/\(number)/\(number)_000.\(coverPageExtension(forEpisode: episode))"]
        + (firstPage(forEpisode: episode)..<nposPage[index.0][numbers[episode]]!).map{"https://yugostrip\(bucketSuffix).fra1.digitaloceanspaces.com/\(number)/\(number)_\(String(format: "%03d", $0)).\(commonExtension)"}
    }
    
    static var averageEpisodeSizeMB = 67
    
    private static func coverPageExtension(forEpisode: Int) -> String {
        let index = flavorIndex(forEpisode: forEpisode)
        let number = numbers[forEpisode]
        switch sectionInfo[index.0].2 {
        case "alanford":
            if number.count == 2 {
                switch number {
                case "52"..."60": return "png"
                default: return "jpg"
                }
            } else {
                return "jpg"
            }
        case "asterix":
            switch number {
            case "29"..."33": return "png"
            default: return "jpg"
            }
        default: return "jpg"
        }
    }

    private static func commonPageExtension(forEpisode: Int) -> String {
        let index = flavorIndex(forEpisode: forEpisode)
        let number = numbers[forEpisode]
        switch sectionInfo[index.0].2 {
        case "alanford":
            if number.count == 2 {
                switch number {
                case "26"..."60": return "png"
                case "97"..."99": return "png"
                default: return "jpg"
                }
            } else if number.count == 3 {
                switch number {
                case "100": return "png"
                case "469"..."472": return "png"
                default: return "jpg"
                }
            } else {
                return "jpg"
            }
        case "asterix":
            switch number {
            case "29"..."33": return "png"
            default: return "jpg"
            }
        default: return "jpg"
        }
    }

    static let sectionInfo: [(String, Int, String)] = [
        ("", titles_alanFord.count, "alanford"),
        ("No", titles_misterNo.count, "misterno"),
        ("Zg", titles_zagor.count, "zagor"),
        ("Bl", titles_blek.count, "blek"),
        ("DD", titles_dylanDog.count, "dylandog"),
        ("TW", titles_texWiller.count, "texwiller"),
        ("NN", titles_nathanNever.count, "nathannever"),
        ("KM", titles_komandantMark.count, "komandantmark"),
        ("Nj", titles_ninja.count, "ninja"),
        ("s8", titles_strip82.count, "strip82"),
        ("TT", titles_talicniTom.count, "talicnitom"),
        ("aO", titles_asterix.count, "asterix"),
        ("OS", titles_otkriceSveta.count, "otkricesveta"),
        ("dv", titles_druzinaOdVjesala.count, "druzinaodvjesala"),
    ]

    static let titles: [String] =
        titles_alanFord +
        titles_misterNo +
        titles_zagor +
        titles_blek +
        titles_dylanDog +
        titles_texWiller +
        titles_nathanNever +
        titles_komandantMark +
        titles_ninja +
        titles_strip82 +
        titles_talicniTom +
        titles_asterix +
        titles_otkriceSveta +
        titles_druzinaOdVjesala

    static let numbers: [String] =
        numbers_alanFord +
        numbers_misterNo +
        numbers_zagor +
        numbers_blek +
        numbers_dylanDog +
        numbers_texWiller +
        numbers_nathanNever +
        numbers_komandantMark +
        numbers_ninja +
        numbers_strip82 +
        numbers_talicniTom +
        numbers_asterix +
        numbers_otkriceSveta +
        numbers_druzinaOdVjesala

    static let dates: [String] =
        dates_alanFord +
        dates_misterNo +
        dates_zagor +
        dates_blek +
        dates_dylanDog +
        dates_texWiller +
        dates_nathanNever +
        dates_komandantMark +
        dates_ninja +
        dates_strip82 +
        dates_talicniTom +
        dates_asterix +
        dates_otkriceSveta +
        dates_druzinaOdVjesala

    private static let nposPage: [[String:Int]] = [
        nposPage_alanFord,
        nposPage_misterNo,
        nposPage_zagor,
        nposPage_blek,
        nposPage_dylanDog,
        nposPage_texWiller,
        nposPage_nathanNever,
        nposPage_komandantMark,
        nposPage_ninja,
        nposPage_strip82,
        nposPage_talicniTom,
        nposPage_asterix,
        nposPage_otkriceSveta,
        nposPage_druzinaOdVjesala]

    static let appId = 1643426345
}
