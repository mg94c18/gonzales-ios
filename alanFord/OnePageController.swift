//
//  OnePageController.swift
//  UIKitAppTest
//
//  Created by Stevanovic, Sasa on 7/18/22.
//

import Foundation
import UIKit

extension OnePageController: ImageDownloaderDelegate {
    func imageDownloadFailed(sender: ImageDownloader, error: Error) {
        handleError()
    }
    
    func httpConnectionFailed(sender: ImageDownloader, statusCode: Int?) {
        handleError()
    }
    
    func cantSaveFile(sender: ImageDownloader) {
    }
    
    func invalidImageData(sender: ImageDownloader) {
        handleError()
    }
    
    func dataSuccess(sender: ImageDownloader, id: Int) {
        // TODO: ako fajl ne valja, obrisati (videti stari FileManager.default.removeItem koji sam pomerio)
        DispatchQueue.main.async {
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.stopAnimating()
            DetailViewController.onEpisodeDownloaded(id)
            // TODO: Play button after the very first download
        }
    }
    
    func storageSuccess(sender: ImageDownloader) {
    }
}

class OnePageController : UIViewController {
    var inLandscape: Bool = false

    var page: (Int, [String], [String], [String]) = (-1, [""], [""], [""]) {
        didSet {
            fileNameSuffix = OnePageController.lastChunk(from: page.1[0], startingWith: "/")
        }
    }

    static var lastLoadedIndex: Int = -1
    var task: URLSessionDataTask?
    var downloadDir: URL?
    var fileNameSuffix: String = ""
    var translationFinal: Bool = false

    static func lastChunk(from s: String, startingWith c: Character) -> String {
        guard let pos = s.lastIndex(of: c) else {
            return ""
        }
        return String(s[pos...])
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if page.0 == -1 {
            activityIndicator.hidesWhenStopped = false
            activityIndicator.stopAnimating()
            return
        }
        inLandscape = (view.frame.width > view.frame.height)
        refreshWebView()
        postLoad()
    }
    
    func refreshWebView() {
        let translation = translationFinal ? page.3 : page.2
        let htmlContent = OnePageController.createHtml(tekst: page.1, prevod: translation, removeGroupings: false, author: "author", a3byka: false, inLandscape: inLandscape, searchedWord: "", fontSize: inLandscape ? 3 : 5)

        // webView.scalesPageToFit = true
        // https://developer.apple.com/documentation/uikit/uitextview
        // It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app.
        webView.loadHTMLString(htmlContent, baseURL: nil)
        webView.allowsLinkPreview = false
        webView.allowsInlineMediaPlayback = false
        webView.mediaPlaybackAllowsAirPlay = false
        webView.allowsPictureInPictureMediaPlayback = false
    }
    
    // Kažu da ovo treba da radi jer navodno kreiraš u portrait pa se ovo pozove...  Ali ne.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        inLandscape = (size.width > size.height)
        refreshWebView()
        super.viewWillTransition(to: size, with: coordinator)
    }

    func handleError() {
        DispatchQueue.main.async {
            self.activityIndicator.hidesWhenStopped = false
            self.activityIndicator.stopAnimating()
        }
    }

    func toggleTranslation() {
        translationFinal = !translationFinal
        refreshWebView()
    }

    func postLoad() {
        if page.0 == -1 {
            return
        }
        guard !fileNameSuffix.isEmpty else {
            return
        }
        guard let cacheDir = downloadDir else {
            startDownloading("")
            return
        }
        let file = cacheDir.path + fileNameSuffix
        if !FileManager.default.fileExists(atPath: file) {
            activityIndicator.startAnimating()
            startDownloading(file)
            return
        }
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
    
    func startDownloading(_ file: String) {
        let downloader = ImageDownloader(id: page.0, url: page.1[0], fileName: file, delegate: self, tmpSuffix: ".tmp.ui")
        task = downloader.createTask()
        task!.resume()
    }

    // ../Gonzales/app/src/main/java/org/mg94c18/gonzales/PageAdapter.java
    // private static String createHtml
    static func createHtml(tekst: [String], prevod: [String], removeGroupings: Bool, author: String, a3byka: Bool, inLandscape: Bool, searchedWord: String, fontSize: Int) -> String {
        // TODO: string stream instead of string directly?
        var builder = "<html><head><meta http-equiv=\"content-type\" value=\"UTF-8\"><title></title><style>* { font-size: \(fontSize)vw; }</style></head><body>"
        if inLandscape && !prevod.isEmpty {
            builder += "<table width=\"100%\">"
            for i in stride(from: 2, to: tekst.count, by: 1) {
                builder += "<tr><td width=\"50%\">"
                if (tekst[i].isEmpty) {
                    builder += "&nbsp;"
                } else {
                    builder += applyFilters(line: tekst[i], hints: true, a3byka: a3byka, removeGroupings: removeGroupings, searchedWord: searchedWord)
                }
                builder += "</td><td width=\"50%\">"
                if (i < prevod.count) {
                    builder += applyFilters(line: prevod[i], hints: true, a3byka: a3byka, removeGroupings: false, searchedWord: searchedWord)
                }
                builder += "</td></tr>"
            }
            builder += "</table>"
        } else {
            builder += "<p>\(author)<br>"
            if tekst.count > 1 && !tekst[1].isEmpty {
                builder += tekst[1]
            }
            builder += "<br>"
            builder += "</p><p>"
            for i in stride(from: 2, to: tekst.count, by: 1) {
                builder += applyFilters(line: tekst[i], hints: false, a3byka: a3byka, removeGroupings: true, searchedWord: searchedWord)
                builder += "<br>"
            }
            builder += "</p>"
        }
        builder += "</body></head></html>"
        return builder
    }

    // ../Gonzales/app/src/main/java/org/mg94c18/gonzales/PageAdapter.java
    // private static String applyFilters
    static func applyFilters(line: String, hints: Bool, a3byka: Bool, removeGroupings: Bool, searchedWord: String) -> String {
        return line
    }

    func cancel() {
        task?.cancel()
    }
}
