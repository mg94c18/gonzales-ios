//
//  NowPlayingStuff.swift
//  MasterDetailTest
//
//  Created by Korisnik on 2/25/25.
//  Copyright © 2025 Stevanovic, Sasa. All rights reserved.
//

import Foundation
import MediaPlayer

class NowPlayingStuff {
    private let infoCenter: MPNowPlayingInfoCenter
    private let commandCenter: MPRemoteCommandCenter
    private var lastPaused: Bool

    init() {
        infoCenter = MPNowPlayingInfoCenter.default()
        commandCenter = MPRemoteCommandCenter.shared()
        lastPaused = true

        commandCenter.enableLanguageOptionCommand.isEnabled = false;
        commandCenter.disableLanguageOptionCommand.isEnabled = false;
        commandCenter.changePlaybackRateCommand.isEnabled = false;
        commandCenter.changeRepeatModeCommand.isEnabled = false;
        commandCenter.changeShuffleModeCommand.isEnabled = false;
        commandCenter.nextTrackCommand.isEnabled = false;
        commandCenter.previousTrackCommand.isEnabled = false;
        commandCenter.skipForwardCommand.isEnabled = false;
        commandCenter.skipBackwardCommand.isEnabled = false;
        commandCenter.seekForwardCommand.isEnabled = false;
        commandCenter.seekBackwardCommand.isEnabled = false;
        commandCenter.changePlaybackPositionCommand.isEnabled = false;
        commandCenter.ratingCommand.isEnabled = false;
        commandCenter.likeCommand.isEnabled = false;
        commandCenter.dislikeCommand.isEnabled = false;
        commandCenter.bookmarkCommand.isEnabled = false;

        commandCenter.pauseCommand.addTarget { _ in
            let res: Bool
            AppDelegate.log("pauseCommand - \(self.lastPaused)")
            if !self.lastPaused {
                res = AppDelegate.externalPause()
            } else {
                res = true
            }
            return res ? .success : .commandFailed
        }
        commandCenter.playCommand.addTarget { _ in
            let res: Bool
            AppDelegate.log("playCommand - \(self.lastPaused)")
            if self.lastPaused {
                res = AppDelegate.externalResume()
            } else {
                res = true
            }
            return res ? .success : .commandFailed
        }
        commandCenter.stopCommand.addTarget { _ in
            AppDelegate.log("stopCommand - \(self.lastPaused)")
            AppDelegate.stop()
            return .success
        }
        commandCenter.togglePlayPauseCommand.addTarget { _ in
            let res: Bool
            AppDelegate.log("toggleCommand - \(self.lastPaused)")
            if self.lastPaused {
                res = AppDelegate.externalResume()
            } else {
                res = AppDelegate.externalPause()
            }
            return res ? .success : .commandFailed
        }
    }

    func uiRefresh(_ nowPlaying: Int, _ paused: Bool, _ timings: (Float, Float)?) {
        AppDelegate.log("uiRefresh(\(nowPlaying), \(paused), \(String(describing: timings)))")

        lastPaused = paused
        if nowPlaying == -1 {
            infoCenter.nowPlayingInfo = nil

            commandCenter.pauseCommand.isEnabled = false;
            commandCenter.playCommand.isEnabled = false;
            commandCenter.stopCommand.isEnabled = false;
            commandCenter.togglePlayPauseCommand.isEnabled = false;

            return
        }

        commandCenter.pauseCommand.isEnabled = !paused;
        commandCenter.playCommand.isEnabled = paused;
        commandCenter.stopCommand.isEnabled = true;
        commandCenter.togglePlayPauseCommand.isEnabled = true;

        var nowPlayingInfo = infoCenter.nowPlayingInfo ?? [String: Any]()

        // MPNowPlayingInfoCollectionIdentifier
        nowPlayingInfo[MPNowPlayingInfoPropertyAvailableLanguageOptions] = [MPNowPlayingInfoLanguageOptionGroup]()
        // MPNowPlayingInfoPropertyAssetURL
        // MPNowPlayingInfoPropertyChapterCount
        // MPNowPlayingInfoPropertyChapterNumber
        nowPlayingInfo[MPNowPlayingInfoPropertyCurrentLanguageOptions] = [MPNowPlayingInfoLanguageOption]()
        nowPlayingInfo[MPNowPlayingInfoPropertyDefaultPlaybackRate] = 1.0
        // MPNowPlayingInfoPropertyCurrentPlaybackDate
        // MPNowPlayingInfoPropertyElapsedPlaybackTime - OK
        // MPNowPlayingInfoPropertyExternalContentIdentifier
        // MPNowPlayingInfoPropertyExternalUserProfileIdentifier
        // MPNowPlayingInfoPropertyExternalUserProfileIdentifier
        nowPlayingInfo[MPNowPlayingInfoPropertyIsLiveStream] = 0.0
        nowPlayingInfo[MPNowPlayingInfoPropertyMediaType] = MPNowPlayingInfoMediaType.audio.rawValue
        // MPNowPlayingInfoPropertyPlaybackProgress
        // MPNowPlayingInfoPropertyPlaybackQueueCount - ?
        // MPNowPlayingInfoPropertyPlaybackQueueIndex - ?
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = 1.0
        // MPNowPlayingInfoPropertyServiceIdentifier

        nowPlayingInfo[MPMediaItemPropertyTitle] = Assets.titles[nowPlaying]
        nowPlayingInfo[MPMediaItemPropertyArtist] = Assets.dates[nowPlaying]
        nowPlayingInfo[MPMediaItemPropertyArtwork] = nil
        nowPlayingInfo[MPMediaItemPropertyAlbumArtist] = nil
        nowPlayingInfo[MPMediaItemPropertyAlbumTitle] = nil

        if let timings = timings {
            nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = timings.0
            nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = timings.1
        }

        infoCenter.nowPlayingInfo = nowPlayingInfo
    }
}
