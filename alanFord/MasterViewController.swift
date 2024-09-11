//
//  MasterViewController.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 1/22/19.
//  Copyright © 2019 Stevanovic, Sasa. All rights reserved.
//

import UIKit

// https://stackoverflow.com/questions/27243158/hiding-the-master-view-controller-with-uisplitviewcontroller-in-ios8
extension UISplitViewController {
    func toggleMasterView() {
        let barButtonItem = self.displayModeButtonItem
        if let action = barButtonItem.action {
            UIApplication.shared.sendAction(action, to: barButtonItem.target, from: .none, for: .none)
        }
    }
}

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var initialPageIndex: Int?
    @IBOutlet weak var searchBar: UISearchBar!
    var searchText: String = "" {
        didSet {
            if searchText.isEmpty {
                episodeMatches.removeAll()
                return
            }
            if searchText == "strana1" {
                UserDefaults.standard.set(true, forKey: "shouldShowCover")
                DispatchQueue.main.async {
                    self.searchBar.text = ""
                }
                searchText = ""
                return
            }
            findEpisodeMatches()
        }
    }
    static let searchReplacements: [(String, String)] = [
        ("c", "ć"),
        ("s", "š"),
        ("c", "č"),
        ("z", "ž"),
        ("dj", "đ"),
        ("č", "ć"),
        ("ć", "č"),
        ("e", "je"),
        ("e", "ije"),
        ("je", "e"),
        ("ije", "e")]
    var episodeMatches: [Int] = []
    static var titlesLowercased: [String] = []

    func searchedForDownloadedOnes() -> Bool {
        return searchText == "%"
    }

    func findEpisodeMatches() {
        episodeMatches.removeAll()

        let searchTextLowercased = searchText.lowercased()
        var searchFor = [searchTextLowercased]
        for r in MasterViewController.searchReplacements {
            let candidate = searchTextLowercased.replacingOccurrences(of: r.0, with: r.1)
            if candidate != searchTextLowercased {
                searchFor.append(candidate)
            }
        }
        if MasterViewController.titlesLowercased.isEmpty {
            MasterViewController.titlesLowercased.reserveCapacity(Assets.titles.count)
            for i in 0..<Assets.titles.count {
                MasterViewController.titlesLowercased.append(Assets.titles[i].lowercased())
            }
        }

        // TODO: dodati ovde da ako je nova reč ista kao stara samo se menja (oduzima ili dodaje) jedno slovo, onda da iskoristi prethodni search.  Ako se dodaje, onda treba tražiti samo kroz prethodni search.  Ako se oduzima, onda prosto se ide nazad na prethodni search koji je već izračunat.
        // TODO: kad se obriše search, treba da se obrišu i te optimizacije (ako je nešto sačuvano)
        // TODO: mada, onda treba paziti na primer ako neko traži d a posle doda j, onda postane đ i može da ima nove rezultate...
        for i in 0..<MasterViewController.titlesLowercased.count {
            for j in searchFor {
                if MasterViewController.titlesLowercased[i].contains(j) || Assets.numbers[i].contains(j) || Assets.dates[i].contains(j) {
                    episodeMatches.append(i)
                    break
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        if let split = splitViewController {
            // na starom iPad radi polovično: ugasi otvaranje, ali ne ugasi zatvaranje
            // kad je side panel otvoren a probam da mrdam po slici, ima crash
            split.presentsWithGesture = false
            // takođe ne radi
            // https://stackoverflow.com/questions/13715250/uisplitviewcontroller-presentswithgesture-not-working
            // navigationController?.interactivePopGestureRecognizer?.isEnabled = false

            split.preferredDisplayMode = .primaryHidden

            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }

        if DetailViewController.lastLoadedEpisode == -1 {
            let episodeId = UserDefaults.standard.integer(forKey: "lastEpisodeId")
            initialPageIndex = UserDefaults.standard.integer(forKey: "lastPageIndex")
            tableView.selectRow(at: Assets.indexPath(forEpisode: episodeId), animated: false, scrollPosition: .middle)
            performSegue(withIdentifier: "showDetail", sender: navigationController)
        } else {
            tableView.selectRow(at: Assets.indexPath(forEpisode: DetailViewController.lastLoadedEpisode), animated: false, scrollPosition: .middle)
            if let split = splitViewController {
                split.toggleMasterView()
            }
        }
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
        navigationItem.leftBarButtonItem = nil // UIBarButtonItem(customView: searchBar)
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = false

        let selection = tableView.indexPathForSelectedRow
        tableView.reloadData()
        tableView.selectRow(at: selection, animated: false, scrollPosition: .none)

        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                if searchText.isEmpty {
                    controller.episodeId = episodeIndex(indexPath)
                } else {
                    controller.episodeId = episodeMatches[indexPath.row]
                }
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
                if let initialPageIndex = initialPageIndex {
                    controller.initialPageIndex = initialPageIndex
                    self.initialPageIndex = nil
                } else {
                    if controller.episodeId == DetailViewController.lastLoadedEpisode && OnePageController.lastLoadedIndex != -1 {
                        controller.initialPageIndex = OnePageController.lastLoadedIndex
                    } else if let previouslyLoaded = DetailViewController.previouslyLoaded,
                              controller.episodeId == previouslyLoaded.0 {
                        controller.initialPageIndex = previouslyLoaded.1
                    } else {
                        controller.initialPageIndex = 0
                    }
                    if let split = splitViewController {
                        split.toggleMasterView()
                    }
                }
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        if searchText.isEmpty {
            return Assets.sectionInfo.count
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchText.isEmpty {
            return Assets.sectionInfo[section].1
        } else {
            return episodeMatches.count
        }
    }
    
    private func episodeIndex(_ indexPath: IndexPath) -> Int {
        var previousRows: Int = 0
        for i in 0..<indexPath.section {
            previousRows += Assets.sectionInfo[i].1
        }
        return previousRows + indexPath.row
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let episodeId: Int
        if searchText.isEmpty {
            episodeId = episodeIndex(indexPath)
        } else {
            episodeId = episodeMatches[indexPath.row]
        }
        var title = "\(episodeId + 1). \(Assets.titles[episodeId])"
        cell.textLabel!.text = title
        
        return cell
    }

}

extension MasterViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        tableView.reloadData()
        updateRowSelection(self.searchText.isEmpty ? .middle : .none)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchText = ""
        tableView.reloadData()
        updateRowSelection(.middle)
    }
    
    func updateRowSelection(_ position: UITableView.ScrollPosition) {
        guard DetailViewController.lastLoadedEpisode != -1 else {
            return
        }
        let selectedId = DetailViewController.lastLoadedEpisode
        if searchText == "" {
            tableView.selectRow(at: Assets.indexPath(forEpisode: selectedId), animated: true, scrollPosition: position)
        } else {
            for i in 0..<episodeMatches.count {
                if episodeMatches[i] == selectedId {
                    tableView.selectRow(at: Assets.indexPath(forEpisode: i), animated: true, scrollPosition: position)
                }
            }
        }
    }
}
