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
    
    func dataSuccess(sender: ImageDownloader, image: UIImage) {
        updateView(with: image)
    }
    
    func storageSuccess(sender: ImageDownloader) {
    }
    
}

class OnePageController : UIViewController {
    var page: (Int, String) = (-1, "") {
        didSet {
            fileNameSuffix = OnePageController.lastChunk(from: page.1, startingWith: "/")
            preload()
        }
    }

    static var lastLoadedIndex: Int = -1
    var task: URLSessionDataTask?
    var image: UIImage?
    var downloadDir: URL?
    var fileNameSuffix: String = ""
    var didLoad: Bool = false // možda je ovo isto kao isViewLoaded a možda i nije, pa za svaki slučaj

    static func lastChunk(from s: String, startingWith c: Character) -> String {
        guard let pos = s.lastIndex(of: c) else {
            return ""
        }
        return String(s[pos...])
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if page.0 == -1 {
            activityIndicator.stopAnimating()
            return
        }
        didLoad = true
        if let image = image {
            self.imageView.image = image
            self.activityIndicator.stopAnimating()
        }
    }
    
    func handleError() {
        DispatchQueue.main.async {
            if self.didLoad {
                self.activityIndicator.hidesWhenStopped = false
                self.activityIndicator.stopAnimating()
            }
        }
    }

    func preload() {
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
            startDownloading(file)
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            if let image = UIImage(contentsOfFile: file) {
                self.updateView(with: image)
            } else {
                // Should never happen
                self.startDownloading(file)
                try? FileManager.default.removeItem(atPath: file)
            }
        }
    }
    
    func startDownloading(_ file: String) {
        let downloader = ImageDownloader(id: page.0, url: page.1, fileName: file, delegate: self, tmpSuffix: ".tmp.ui")
        task = downloader.createTask()
        task!.resume()
    }

    func updateView(with image: UIImage) {
        DispatchQueue.main.async {
            if self.didLoad {
                self.imageView.image = image
                self.activityIndicator.stopAnimating()
            } else {
                self.image = image
            }
        }
    }

    func cancel() {
        task?.cancel()
    }
}
