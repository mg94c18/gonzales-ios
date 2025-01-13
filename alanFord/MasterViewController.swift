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
    static let searchProvider = SearchProvider()

    var detailViewController: DetailViewController? = nil
    var initialPageIndex: Int?
    @IBOutlet weak var searchBar: UISearchBar!
    var searchText: String = "" {
        didSet {
            if searchText.isEmpty {
                episodeMatches.removeAll(keepingCapacity: true)
                return
            }
            if searchText == "a3byka" {
                Assets.toggleCyrillic()
                MasterViewController.searchProvider.invalidateTrie()
                MasterViewController.titlesLowercased.removeAll(keepingCapacity: true)
                MasterViewController.searchProvider.populateTrie(numbers: Assets.numbers, titles: Assets.titles)
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
    var episodeMatches: [(Int, String)] = []
    static var titlesLowercased: [String] = []
    
    func uiRefresh(_ nowPlaying: Int, _ paused: Bool) {
        let selection = tableView.indexPathForSelectedRow
        // TODO: here we don't use what we pass in, that's kind of OK, but can be better
        tableView.reloadData()
        tableView.selectRow(at: selection, animated: false, scrollPosition: .none)
    }

    func searchedForDownloadedOnes() -> Bool {
        return searchText == "%"
    }

    func findEpisodeMatches() {
        let searchTextLowercased = searchText.lowercased()
        episodeMatches.removeAll(keepingCapacity: true)

        if MasterViewController.searchProvider.ready() {
            let results = MasterViewController.searchProvider.query(searchTextLowercased)
            episodeMatches = results
        } else {
            findEpisodeMatchesLegacy(searchTextLowercased)
        }
    }

    func findEpisodeMatchesLegacy(_ searchTextLowercased: String) {
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

        for i in 0..<MasterViewController.titlesLowercased.count {
            for j in searchFor {
                if MasterViewController.titlesLowercased[i].contains(j) || Assets.numbers[i].contains(j) || Assets.dates[i].contains(j) {
                    episodeMatches.append((i, ""))
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
            let episodeId = AppDelegate.getLastEpisodeId()
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

        uiRefresh(AppDelegate.nowPlaying, AppDelegate.paused)

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
                    controller.searchedWord = ""
                } else {
                    controller.episodeId = episodeMatches[indexPath.row].0
                    controller.searchedWord = episodeMatches[indexPath.row].1
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
            let prefix = AppDelegate.nowPlaying == episodeId ? AppDelegate.PLAY_PREFIX : ""
            cell.textLabel!.text = "\(prefix)\(episodeId + 1). \(Assets.titles[episodeId])"
            cell.detailTextLabel!.text = ""
        } else {
            if episodeMatches[indexPath.row].1.isEmpty {
                episodeId = episodeMatches[indexPath.row].0
                cell.textLabel!.text = "\(episodeId + 1). \(Assets.titles[episodeId])"
                cell.detailTextLabel!.text = ""
            } else {
                episodeId = episodeMatches[indexPath.row].0
                cell.textLabel!.text = episodeMatches[indexPath.row].1
                cell.detailTextLabel!.text = "\(Assets.titles[episodeId])"
            }
        }
        
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
        var rowIndex = -1
        if searchText == "" {
            rowIndex = selectedId
        } else if MasterViewController.searchProvider.ready() {
            // No highlighting during cross-track search
        } else {
            for i in 0..<episodeMatches.count {
                if episodeMatches[i].0 == selectedId {
                    if episodeMatches[i].1.isEmpty {
                        rowIndex = i
                    }
                }
            }
        }
        if rowIndex != -1 {
            tableView.selectRow(at: Assets.indexPath(forEpisode: rowIndex), animated: true, scrollPosition: position)
        } else {
            tableView.scrollToRow(at: IndexPath(indexes: [0, 0]), at: .top, animated: true)
        }
    }
}
