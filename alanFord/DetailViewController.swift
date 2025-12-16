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
    var searchedWord: String = ""
    var initialPageIndex: Int = 0 // nepotrebno ovde, ali korisno za UI trikove

    private var pages: [String] = []
    private var downloadDir: URL?
    private var offerDeleteDownloaded: Bool = false
    private var onePageController: OnePageController?

    static let CHECKMARK_STR : String = "✓ "

    var firstFlip = ("", false)

    override func viewDidAppear(_ animated: Bool) {
        MasterViewController.searchProvider.populateTrie(numbers: Assets.numbers, titles: Assets.titles)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if episodeId == -1 {
            episodeId = AppDelegate.getLastEpisodeId()
        }

        pages = Assets.pages(forEpisode: episodeId)
        downloadDir = ImageDownloader.cacheDir
        let firstController = storyboard?.instantiateViewController(withIdentifier: "OnePageController") as! OnePageController
        firstController.downloadDir = downloadDir

        firstController.page = (episodeId,
                                pages,
                                Assets.pages(forEpisode: episodeId, withTranslation: ".bukvalno"),
                                Assets.pages(forEpisode: episodeId, withTranslation: ".finalno"),
                                Assets.dates[episodeId],
                                searchedWord)

        // TODO: treba da ima samo jedan child, tako da ne "add"
        self.addChild(firstController)
        self.pageView.addSubview(firstController.view)
        firstController.view.frame = pageView.bounds
        firstController.didMove(toParent: self)
        onePageController = firstController

        if DetailViewController.lastLoadedEpisode != -1 && OnePageController.lastLoadedIndex != -1 {
            DetailViewController.previouslyLoaded = (DetailViewController.lastLoadedEpisode, OnePageController.lastLoadedIndex)
        }
        DetailViewController.lastLoadedEpisode = episodeId
        navigationController?.isNavigationBarHidden = false

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        recognizer.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(recognizer)
        DetailViewController.lastLoadedController = self
        uiRefresh(AppDelegate.nowPlaying, AppDelegate.paused)
    }

    func uiRefresh(_ nowPlaying: Int, _ paused: Bool) {
        updateTitle(nowPlaying, paused)
        postInitDownloadButton(nowPlaying, paused)
    }

    private func updateTitle(_ nowPlaying: Int, _ paused: Bool) {
        let prefix = nowPlaying == episodeId ? AppDelegate.PLAY_PREFIX : ""
        title = prefix + Assets.titles[episodeId]
    }

    private func postInitDownloadButton(_ nowPlaying: Int, _ paused: Bool, at: DispatchTime = .now()) {
        DispatchQueue.main.asyncAfter(deadline: at) {
            self.updateDownloadButton(nowPlaying, paused)
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        postInitDownloadButton(AppDelegate.nowPlaying, AppDelegate.paused)
        super.viewWillTransition(to: size, with: coordinator)
    }

    static let DOWNLOADED_EPISODES = "downloadedEpisodes"
    static let PLAYLIST_EPISODES = "playlistEpisodes"

    static weak var lastLoadedController: DetailViewController? = nil
    static func onEpisodeDownloaded(_ episodeId: Int) {
        let key = DOWNLOADED_EPISODES
        var array = DetailViewController.loadStoredArray(key)
        if let index = array.firstIndex(of: episodeId) {
            array.remove(at: index)
        }
        array.append(episodeId)
        if let lastLoadedController = lastLoadedController {
            if lastLoadedController.isViewLoaded {
                lastLoadedController.postInitDownloadButton(AppDelegate.nowPlaying, AppDelegate.paused)
            }
        }
        storeIdArray(array, key)
    }

    static func storeIdArray(_ array: [Int], _ key: String) {
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
                    AppDelegate.log("Skipping \(elem), probably got removed")
                }
            }
        }
        return ret
    }

    func updateDownloadButton(_ nowPlaying: Int, _ paused: Bool) {
        navigationItem.rightBarButtonItem = nil

        guard let onePageController = onePageController else {
            AppDelegate.log("Unexpected, no onePageController")
            return
        }
        if (onePageController.inLandscape) {
            self.showToggle()
        } else {
            if nowPlaying == -1 {
                if Assets.numbers.isEmpty {
                    return
                }
                self.showMenu()
            } else if paused {
                self.showResume()
            } else {
                self.showStop()
            }
        }
    }

    var playAction: UIAlertAction? = nil
    var playlistTouched = false
    var checkedCnt = 0
    @objc func configurePlay0() {
        var downloadedEpisodes: [Int] = []
        var index: Int = 0
        for number in Assets.numbers {
            downloadedEpisodes.append(index)
            index += 1
        }
        if downloadedEpisodes.isEmpty {
            return
        }

        let playlistEpisodes = DetailViewController.loadStoredArray(DetailViewController.PLAYLIST_EPISODES)

        let confirmation = UIAlertController(title: "Select tracks", message: "", preferredStyle: .alert)
        firstFlip = ("", false)
        checkedCnt = 0
        for episode in downloadedEpisodes {
            confirmation.addTextField(configurationHandler: { textField in
                let title = "\(episode + 1). " + Assets.titles[episode]
                let inPlaylist = playlistEpisodes.contains(episode)
                textField.text = inPlaylist ? DetailViewController.CHECKMARK_STR + title : title
                textField.isUserInteractionEnabled = true
                textField.delegate = self

                if self.firstFlip.0.isEmpty {
                    self.firstFlip.0 = textField.text!
                }
                if inPlaylist {
                    self.checkedCnt += 1
                }
            })
        }
        playlistTouched = false
        playAction = UIAlertAction(title: "Play", style: .default, handler: { _ in
            guard let items = confirmation.textFields else {
                return
            }
            var tracks: [Int] = []
            tracks.reserveCapacity(items.count)
            for i in stride(from: 0, to: items.count, by: 1) {
                if items[i].text!.starts(with: DetailViewController.CHECKMARK_STR) {
                    tracks.append(downloadedEpisodes[i])
                }
            }
            self.startPlayback(of: tracks)
        })
        if !downloadedEpisodes.contains(where: { elem in
            playlistEpisodes.contains(elem)
        }) {
            playAction!.isEnabled = false
        }
        confirmation.addAction(playAction!)
        confirmation.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(confirmation, animated: true, completion: nil)
    }

    @objc func stopPlayback() {
        AppDelegate.stop()
    }

    // "square.and.arrow.down" iz "SF Symbols" za download
    // "wifi.slash" kad nema interneta
    // "rectangle.and.pencil.and.ellipsis" ili prosto "square.and.pencil" za Appstore (jer može da se piše autoru ili da se napiše review)
    func showResume() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "play.circle"), style: .plain, target: self, action: #selector(resumePlayback))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(resumePlayback))
        }
    }

    func showStop() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "stop.circle"), style: .plain, target: self, action: #selector(stopPlayback))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Stop", style: .plain, target: self, action: #selector(stopPlayback))
        }
    }

    func showToggle() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "doc.on.doc"), style: .plain, target: self, action: #selector(toggleTranslation))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Prevod", style: .plain, target: self, action: #selector(toggleTranslation))
        }
    }

    func showMenu() {
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "menucard"), style: .plain, target: self, action: #selector(configurePlay0))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Configure", style: .plain, target: self, action: #selector(configurePlay0))
        }
    }

    @objc func toggleTranslation() {
        onePageController!.toggleTranslation()
    }

    func startPlayback(of tracks: [Int]) {
        if tracks.isEmpty {
            AppDelegate.log("WTF - Playback what?")
            return
        }

        if AppDelegate.paused && !playlistTouched && AppDelegate.pausedNowPlaying != -1 {
            resumePlayback()
        } else {
            AppDelegate.play(tracks, from: self)
            DetailViewController.storeIdArray(tracks, DetailViewController.PLAYLIST_EPISODES)
        }
    }

    @objc func resumePlayback() {
        AppDelegate.resume(from: self)
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
        // TODO: clear queues, trie
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        if firstFlip.1 || firstFlip.0 != textField.text {
            if text.starts(with: DetailViewController.CHECKMARK_STR) {
                textField.text = String(text.dropFirst(DetailViewController.CHECKMARK_STR.count))
                self.checkedCnt -= 1
            } else {
                textField.text = DetailViewController.CHECKMARK_STR + textField.text!
                self.checkedCnt += 1
            }
            self.playAction?.isEnabled = (self.checkedCnt > 0)
            self.playlistTouched = true
        }
        firstFlip.1 = true
        return false
    }

}
