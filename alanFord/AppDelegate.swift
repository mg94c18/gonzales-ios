//
//  AppDelegate.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 1/22/19.
//  Copyright © 2019 Stevanovic, Sasa. All rights reserved.
//

import UIKit
import AVFoundation
import os.log

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    // ../yugostrip-app-ios/alanFord/AppDelegate.swift
    // func progress(forEpisode: Int, changedTo: Int) {
    private func updateControllers(_ nowPlaying: Int, _ paused: Bool) {
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count - 1] as! UINavigationController

        var detail: DetailViewController?
        if let top = navigationController.topViewController as? DetailViewController {
            detail = top
        }
        if let visible = navigationController.visibleViewController as? DetailViewController {
            detail = visible
        }
        if let detail = detail {
            detail.uiRefresh(nowPlaying, paused)
        }

        if let masterNav = splitViewController.viewControllers[0] as? UINavigationController {
            var master: MasterViewController?
            if let top = masterNav.topViewController as? MasterViewController {
                master = top
            }
            if let visible = masterNav.visibleViewController as? MasterViewController {
                master = visible
            }
            if let master = master {
                master.uiRefresh(nowPlaying, paused)
            }
        }
        self.nowPlaying.uiRefresh(nowPlaying, paused, self.timingsFor(trackId: nowPlaying))
    }

    var window: UIWindow?
    static let PLAY_PREFIX = "(...) "
    static var inBackground = false
    static var unseenCrashes = 0
    static var unseenCrashesKey = "unseenCrashes"
    static let lastEpisodeIdKey = "lastEpisodeId"
    private static weak var instance: AppDelegate?
    var itemObservation: NSKeyValueObservation?
    var rateObservation: NSKeyValueObservation?
    @objc var player: AVQueuePlayer = AVQueuePlayer.init(items: []) {
        didSet {
            updatePlayerObservation()
        }
    }
    let nowPlaying = NowPlayingStuff()

    static var pausedNowPlaying = -1

    static var nowPlaying = -1 {
        didSet {
            instance?.updateControllers(nowPlaying, paused)
        }
    }

    static var paused = false {
        didSet {
            instance?.updateControllers(nowPlaying, paused)
        }
    }

    private func activateAndPlay(from controller: UIViewController?) -> Bool {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player.play()
            return true
        } catch let error {
            if let controller = controller {
                let errorReport = UIAlertController(title: "Error", message: "Can't start playback.  Error message: \(error)", preferredStyle: .alert)
                errorReport.addAction(UIAlertAction(title: "OK", style: .default))
                controller.present(errorReport, animated: true, completion: nil)
            } else {
                AppDelegate.log("WTF - can't start playback: \(error)")
            }
            return false
        }
    }

    static func resume(from controller: UIViewController) {
        guard let instance = AppDelegate.instance else {
            log("WTF - instance is gone")
            return
        }
        if instance.activateAndPlay(from: controller) {
            if nowPlaying == -1 && pausedNowPlaying != -1 {
                nowPlaying = pausedNowPlaying
                pausedNowPlaying = -1
            }
        }
    }

    static func play(_ tracks: [Int], from controller: UIViewController) {
        guard let instance = AppDelegate.instance else {
            log("WTF - instance is gone")
            return
        }
        guard let cacheDir = ImageDownloader.cacheDir else {
            AppDelegate.log("WTF - Playback from where?")
            return
        }

        var playerItems: [AVPlayerItem] = []
        playerItems.reserveCapacity(tracks.count)

        instance.itemIdMap.removeAll(keepingCapacity: true)
        for i in stride(from: 0, to: tracks.count, by: 1) {
            let item = AVPlayerItem.init(url: cacheDir.appendingPathComponent(Assets.numbers[tracks[i]] + ".mp3").absoluteURL)
            playerItems.append(item)
            instance.itemIdMap[item] = tracks[i]
        }

        instance.itemObservation?.invalidate()
        instance.rateObservation?.invalidate()
        instance.player = AVQueuePlayer.init(items: playerItems)
        instance.player.allowsExternalPlayback = false
        instance.player.actionAtItemEnd = .advance
        if instance.activateAndPlay(from: controller) {
            // Key-Value Observing fails to inform of the very first track, most likely because it sets it during init and it doesn't change when .play() is called.
            // To know when the player item is ready for playback, observe the value of its status property. Add this observation before you call the player’s replaceCurrentItem(with:) method, because associating the player item with a player is the system’s cue to load the item’s media
            // TODO: ovo može da se poboljša, ali pošto je sve lokalno, možda nema veze.  Uglavnom, na prvoj pesmi se ne vide vremena (dokle je stiglo i kolko traje), i možda mogu da slušam .currentItem.status a ne .currentItem
            // When a player item is created, its status is AVPlayerItem.Status.unknown, meaning its media hasn’t been loaded and has not yet been enqueued for playback. Associating a player item with an AVPlayer immediately begins enqueuing the item’s media and preparing it for playback. When the player item’s media has been loaded and is ready for use, its status will change to AVPlayerItem.Status.readyToPlay. You can observe this change using key-value observing.
            nowPlaying = tracks[0]
        }
    }

    static func stop() {
        guard let instance = AppDelegate.instance else {
            log("WTF - instance is gone")
            return
        }
        instance.player.pause()
        try? AVAudioSession.sharedInstance().setActive(false)
        pausedNowPlaying = nowPlaying
        nowPlaying = -1
    }

    static func externalPause() -> Bool {
        guard let instance = AppDelegate.instance else {
            log("WTF - instance is gone")
            return false
        }
        instance.player.pause()
        try? AVAudioSession.sharedInstance().setActive(false)
        return true
    }

    static func externalResume() -> Bool {
        guard let instance = AppDelegate.instance else {
            log("WTF - instance is gone")
            return false
        }
        return instance.activateAndPlay(from: nil)
    }

    func timingsFor(trackId: Int) -> (Float, Float)? {
        if trackId == -1 {
            return nil
        }
        guard let currentItem = player.currentItem else {
            AppDelegate.log("WTF - can't find current item")
            return nil
        }
        guard let currentId = itemIdMap[currentItem] else {
            AppDelegate.log("WTF - can't find ID for the current item")
            return nil
        }
        if currentId != trackId {
            AppDelegate.log("WTF - current ID \(currentId) doesn't match expected ID \(trackId)")
            return nil
        }
        if (currentItem.status != .readyToPlay) {
            return nil
        }
        return (Float(currentItem.currentTime().seconds), Float(currentItem.duration.seconds))
    }

    var itemIdMap: [AVPlayerItem : Int] = [:]

    func updatePlayerObservation() {
        itemObservation = observe(\.player.currentItem, options: [.old, .new], changeHandler: { object, change in
            if object.player != self.player {
                return
            }
            guard let newItem = change.newValue else {
                return
            }
            if newItem == nil {
                AppDelegate.nowPlaying = -1
                AppDelegate.pausedNowPlaying = -1
            } else {
                let id = self.itemIdMap[newItem!]
                if id != nil {
                    AppDelegate.nowPlaying = id!
                } else {
                    AppDelegate.log("WTF - we have a valid ID (\(id!)) but no recollection of it")
                    AppDelegate.nowPlaying = -1
                }
            }
        })
        rateObservation = observe(\.player.rate, options: [.old, .new], changeHandler: { object, change in
            if object.player != self.player {
                return
            }
            guard let newItem = change.newValue else {
                return
            }
            AppDelegate.paused = newItem == 0.0
        })
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.instance = self
        // Override point for customization after application launch.
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
 
        AppDelegate.unseenCrashes = UserDefaults.standard.integer(forKey: AppDelegate.unseenCrashesKey)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        AppDelegate.inBackground = true
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if DetailViewController.lastLoadedEpisode != -1 {
            UserDefaults.standard.set(DetailViewController.lastLoadedEpisode, forKey: AppDelegate.lastEpisodeIdKey)
        }
        DetailViewController.previouslyLoaded = nil
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        AppDelegate.inBackground = false
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    // TODO: čemu ovo služi?  a bez njega ne radi
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.episodeId == -1 {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

    static func log(_ message: String) {
        if #available(iOS 10.0, *) {
            os_log("%s", message)
        } else {
            // Fallback on earlier versions
        }
    }

    static func getLastEpisodeId() -> Int {
        guard let id = UserDefaults.standard.object(forKey: AppDelegate.lastEpisodeIdKey) as? Int else {
            return Assets.defaultEpisodeId
        }
        return id
    }
}
