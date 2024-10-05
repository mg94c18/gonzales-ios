//
//  DetailViewController.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 1/22/19.
//  Copyright © 2019 Stevanovic, Sasa. All rights reserved.
//

import UIKit
import AVFoundation
import os.log

class DetailViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    @IBOutlet weak var pageView: UIView!

    static var lastLoadedEpisode: Int = -1
    static var previouslyLoaded: (Int, Int)?

    var episodeId: Int = -1
    var initialPageIndex: Int = 0 // TODO: nepotrebno ovde, ali korisno za UI trikove
    
    private var pages: [String] = []
    private var downloadDir: URL?
    private var offerDeleteDownloaded: Bool = false
    private var downloadedEpisodes: [Int] = []
    private var player: AVPlayer?

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
        postInitDownloadButton()
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

    static func onEpisodeDownloaded(_ episodeId: Int) {
        let key = "downloadedEpisodes"
        var array = DetailViewController.loadStoredArray(key)
        if let index = array.firstIndex(of: episodeId) {
            array.remove(at: index)
        }
        array.append(episodeId)
        var arrayForSaving: [String] = []
        for elem in array {
            arrayForSaving.append("\(Assets.numbers[elem])")
        }
        UserDefaults.standard.set(arrayForSaving, forKey: key)
    }
    
    static func loadStoredArray(_ key: String) -> [Int] {
        var ret: [Int] = []
        if let stored = UserDefaults.standard.array(forKey: key) as? [String] {
            for elem in stored {
                if let index = Assets.numbers.firstIndex(of: elem) {
                    ret.append(index)
                } else {
                    // TODO: Log.w
                }
            }
        }
        return ret
    }
    
    func initDownloadButton() {
        if DetailViewController.loadStoredArray("downloadedEpisodes").isEmpty {
            return
        }
        DispatchQueue.main.async {
            self.showDownload()
        }
    }
    
    @objc func configurePlay0() {
        let downloadedEpisodes = DetailViewController.loadStoredArray("downloadedEpisodes").sorted()
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadedEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayCell", for: indexPath)
        
        var title = "\(downloadedEpisodes[indexPath.row] + 1). \(Assets.titles[downloadedEpisodes[indexPath.row]])"
        cell.textLabel!.text = title
        
        return cell
    }
    
    @objc func configurePlay() {
        downloadedEpisodes = DetailViewController.loadStoredArray("downloadedEpisodes").sorted()
        let playController = storyboard?.instantiateViewController(withIdentifier: "PlayController") as! PlayController
        self.present(playController, animated: true, completion: nil)
        playController.tableView.dataSource = self
        playController.tableView.allowsMultipleSelection = true
        playController.detailViewController = self
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
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down"), style: .plain, target: self, action: #selector(configurePlay))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(configurePlay))
        }
    }
    
    func showCancelDownload() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "x.square"), style: .plain, target: self, action: #selector(cancelDownload))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Otkaži", style: .plain, target: self, action: #selector(cancelDownload))
        }
    }

    func startPlayback(of tracks: [Int]) {
        guard let cacheDir = downloadDir else {
            if #available(iOS 10.0, *) {
                os_log("Playback from where?")
            } else {
                // Fallback on earlier versions
            }
            return
        }
        if tracks.count < 1 {
            if #available(iOS 10.0, *) {
                os_log("Playback what?")
            } else {
                // Fallback on earlier versions
            }
            return
        }

        let trackId = Assets.numbers[tracks[0]]
        let url = cacheDir.appendingPathComponent(trackId + ".mp3").absoluteURL
        player = AVPlayer.init(url: url)
        player!.play()
        dismiss(animated: true)
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

