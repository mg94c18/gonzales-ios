//
//  DetailViewController.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 1/22/19.
//  Copyright © 2019 Stevanovic, Sasa. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var pageView: UIView!

    static var lastLoadedEpisode: Int = -1
    static var previouslyLoaded: (Int, Int)?

    var episodeId: Int = -1
    var initialPageIndex: Int = 0 // TODO: nepotrebno ovde, ali korisno za UI trikove
    
    private var pages: [String] = []
    private var downloadDir: URL?
    private var offerDeleteDownloaded: Bool = false
    private var downloadedEpisodes: [Int] = []
    private var onePageController: OnePageController?

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

        firstController.page = (episodeId,
                                pages,
                                Assets.pages(forEpisode: episodeId, withTranslation: ".bukvalno"),
                                Assets.pages(forEpisode: episodeId, withTranslation: ".finalno"))

        // TODO: treba da ima samo jedan child, tako da ne "add"
        self.addChildViewController(firstController)
        self.pageView.addSubview(firstController.view)
        firstController.view.frame = pageView.bounds
        firstController.didMove(toParentViewController: self)
        onePageController = firstController

        if DetailViewController.lastLoadedEpisode != -1 && OnePageController.lastLoadedIndex != -1 {
            DetailViewController.previouslyLoaded = (DetailViewController.lastLoadedEpisode, OnePageController.lastLoadedIndex)
        }
        DetailViewController.lastLoadedEpisode = episodeId
        title = Assets.titles[episodeId]
        // TODO: ovde pogledati da update-uje title ako svira, na primer "▷ 1/3"
        navigationController?.isNavigationBarHidden = false

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        recognizer.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(recognizer)
        postInitDownloadButton()
    }

    func postInitDownloadButton(at: DispatchTime = .now()) {
        DispatchQueue.main.asyncAfter(deadline: at) {
            self.initDownloadButton()
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        postInitDownloadButton()
        super.viewWillTransition(to: size, with: coordinator)
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
        // TODO: ovde staviti postInitDownloadButton
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
        navigationItem.rightBarButtonItem = nil

        guard let onePageController = onePageController else {
            AppDelegate.log("Unexpected, no onePageController")
            return
        }
        if (onePageController.inLandscape) {
            self.showToggle()
        } else {
            if AppDelegate.player.currentItem == nil {
                if DetailViewController.loadStoredArray("downloadedEpisodes").isEmpty {
                    return
                }
                self.showPlay()
            } else {
                self.showCancel()
            }
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

    @objc func configurePlay() {
        downloadedEpisodes = DetailViewController.loadStoredArray("downloadedEpisodes").sorted()
        let playController = storyboard?.instantiateViewController(withIdentifier: "PlayController") as! PlayController
        self.present(playController, animated: true, completion: nil)
        playController.configure(downloadedEpisodes, self)
    }

    @objc func cancelPlay() {
        postInitDownloadButton(at: .now() + .seconds(1))
        AppDelegate.player.removeAllItems()
    }

    // "square.and.arrow.down" iz "SF Symbols" za download
    // "wifi.slash" kad nema interneta
    // "rectangle.and.pencil.and.ellipsis" ili prosto "square.and.pencil" za Appstore (jer može da se piše autoru ili da se napiše review)
    func showPlay() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "play.circle"), style: .plain, target: self, action: #selector(configurePlay))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(configurePlay))
        }
    }
    
    func showCancel() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "stop.circle"), style: .plain, target: self, action: #selector(cancelPlay))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Stop", style: .plain, target: self, action: #selector(cancelPlay))
        }
    }

    func showToggle() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "doc.on.doc"), style: .plain, target: self, action: #selector(toggleTranslation))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Prevod", style: .plain, target: self, action: #selector(toggleTranslation))
        }
    }
    
    @objc func toggleTranslation() {
        onePageController!.toggleTranslation()
    }

    func startPlayback(of tracks: [Int]) {
        guard let cacheDir = downloadDir else {
            AppDelegate.log("Playback from where?")
            return
        }
        if tracks.count < 1 {
            AppDelegate.log("Playback what?")
            return
        }

        var playerItems: [AVPlayerItem] = []
        playerItems.reserveCapacity(tracks.count)

        for i in stride(from: 0, to: tracks.count, by: 1) {
            playerItems.append(AVPlayerItem.init(url: cacheDir.appendingPathComponent(Assets.numbers[tracks[i]] + ".mp3").absoluteURL))
        }
        AppDelegate.player = AVQueuePlayer.init(items: playerItems)
        AppDelegate.player.actionAtItemEnd = .advance
        AppDelegate.player.play()

        dismiss(animated: true)
        postInitDownloadButton()
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
