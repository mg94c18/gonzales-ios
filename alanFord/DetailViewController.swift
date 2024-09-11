//
//  DetailViewController.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 1/22/19.
//  Copyright © 2019 Stevanovic, Sasa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    func controllerPageReturned(_ ret: OnePageController?) {
        guard let ret = ret else {
            return
        }
        if ret.page.0 != -1 {
            OnePageController.lastLoadedIndex = ret.page.0
        }
    }

    @IBOutlet weak var pageView: UIView!

    var pages: [String] = []
    var episodeId: Int = -1
    // TODO: nepotrebno ovde, ali korisno za UI trikove
    var initialPageIndex: Int = 0
    static var lastLoadedEpisode: Int = -1
    static var previouslyLoaded: (Int, Int)?
    var downloadDir: URL?
    var offerDeleteDownloaded: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if episodeId == -1 {
            episodeId = UserDefaults.standard.integer(forKey: "lastEpisodeId")
        }

        pages = Assets.pages(forEpisode: episodeId)
        downloadDir = ImageDownloader.cacheDir
        let firstController = storyboard?.instantiateViewController(withIdentifier: "OnePageController") as! OnePageController
        firstController.downloadDir = downloadDir

        firstController.page = (episodeId, pages)

        // TODO: treba da ima samo jedan child, tako da ne "add"
        self.addChildViewController(firstController)
        self.pageView.addSubview(firstController.view)
        firstController.view.frame = pageView.bounds
        firstController.didMove(toParentViewController: self)
        
        if DetailViewController.lastLoadedEpisode != -1 && OnePageController.lastLoadedIndex != -1 {
            DetailViewController.previouslyLoaded = (DetailViewController.lastLoadedEpisode, OnePageController.lastLoadedIndex)
        }
        DetailViewController.lastLoadedEpisode = episodeId
        title = Assets.titles[episodeId]
        navigationController?.isNavigationBarHidden = false

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        recognizer.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(recognizer)
        
        if DetailViewController.loadStoredArray("visitedEpisodes").count > 4 {
            postInitDownloadButton()
        }
        DetailViewController.updateVisitedEpisodes(byAdding: episodeId)
    }

    func postInitDownloadButton() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.initDownloadButton()
        }
    }
    
    func postInitDownloadButton(at: DispatchTime) {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: at) {
            self.initDownloadButton()
        }
    }

    static func updateVisitedEpisodes(byAdding episodeId: Int) {
        var visitedEpisodes = DetailViewController.loadStoredArray("visitedEpisodes")
        if let index = visitedEpisodes.firstIndex(of: episodeId) {
            visitedEpisodes.remove(at: index)
        }
        visitedEpisodes.append(episodeId)
        UserDefaults.standard.set(visitedEpisodes, forKey: "visitedEpisodes")
    }
    
    static func loadStoredArray(_ key: String) -> [Int] {
        if let stored = UserDefaults.standard.array(forKey: key) as? [Int] {
            return stored
        } else {
            return []
        }
    }
    
    static func downloadedEpisodes() -> [Int] {
        return loadStoredArray("downloadedEpisodes")
    }

    static func downloadedEpisodesAdd(id: Int) {
        var downloaded = downloadedEpisodes()
        if let index = downloaded.firstIndex(of: id) {
            // TODO: Log.wtf
            return
        }
        downloaded.append(id)
        UserDefaults.standard.set(downloaded, forKey: "downloadedEpisodes")
    }

    func initDownloadButton() {
        if DetailViewController.downloadedEpisodes().isEmpty {
            return
        }
        DispatchQueue.main.async {
            self.showDownload()
        }
    }
    
    @objc func startDownloading() {
        let downloadedEpisodes = DetailViewController.downloadedEpisodes().sorted()
        if downloadedEpisodes.isEmpty {
            return
        }

        let confirmation = UIAlertController(title: "Play", message: "", preferredStyle: .alert)
        for episode in downloadedEpisodes {
            confirmation.addTextField(configurationHandler: { textField in
                textField.text = Assets.titles[episode]
                textField.isUserInteractionEnabled = false
                textField.delegate = self
            })
        }
        confirmation.addAction(UIAlertAction(title: "Play", style: .default))
        confirmation.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(confirmation, animated: true, completion: nil)
    }

    @objc func cancelDownload() {
        postInitDownloadButton(at: .now() + .seconds(3))
        navigationItem.rightBarButtonItem = nil
    }

    // "square.and.arrow.down" iz "SF Symbols" za download
    // "wifi.slash" kad nema interneta
    // "rectangle.and.pencil.and.ellipsis" ili prosto "square.and.pencil" za Appstore (jer može da se piše autoru ili da se napiše review)
    func showDownload() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down"), style: .plain, target: self, action: #selector(startDownloading))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(startDownloading))
        }
    }
    
    func showCancelDownload() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "x.square"), style: .plain, target: self, action: #selector(cancelDownload))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Otkaži", style: .plain, target: self, action: #selector(cancelDownload))
        }
    }

    func showAppstore() {
        let appstoreCount = UserDefaults.standard.integer(forKey: "appstoreCount")
        if appstoreCount >= 3 && AppDelegate.unseenCrashes == 0 {
            return
        }
        if AppDelegate.unseenCrashes > 0 {
           AppDelegate.unseenCrashes -= 1
        }
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(openAppstore))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Appstore", style: .plain, target: self, action: #selector(openAppstore))
        }
    }

    @objc func openAppstore() {
        var appstoreCount = UserDefaults.standard.integer(forKey: "appstoreCount")
        appstoreCount += 1
        UserDefaults.standard.set(appstoreCount, forKey: "appstoreCount")

        let url: URL?
        if AppDelegate.unseenCrashes > 0 {
            url = URL(string: "mailto:yckopo@gmail.com")
        } else {
            url = URL(string: "itms-apps://itunes.apple.com/app/id\(Assets.appId)")
        }

        if let url = url {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    @objc func doubleTap() {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.isNavigationBarHidden = !navigationController.isNavigationBarHidden
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // TODO: clear queues
    }

}

