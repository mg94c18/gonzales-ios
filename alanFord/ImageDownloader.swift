//
//  ImageDownloader.swift
//  MasterDetailTest
//
//  Created by Stevanovic, Sasa on 8/10/22.
//  Copyright © 2022 Stevanovic, Sasa. All rights reserved.
//

import Foundation
import UIKit

protocol ImageDownloaderDelegate {
    func imageDownloadFailed(sender: ImageDownloader, error: Error)
    func httpConnectionFailed(sender: ImageDownloader, statusCode: Int?)
    func cantSaveFile(sender: ImageDownloader)
    func invalidImageData(sender: ImageDownloader)
    func dataSuccess(sender: ImageDownloader, image: UIImage)
    func storageSuccess(sender: ImageDownloader)
}

class ImageDownloader {
    let id: Int
    let url: String
    let fileName: String
    let delegate: ImageDownloaderDelegate
    let tmpSuffix: String
    
    init(id: Int, url: String, fileName: String, delegate: ImageDownloaderDelegate, tmpSuffix: String) {
        self.id = id
        self.url = url
        self.fileName = fileName
        self.delegate = delegate
        self.tmpSuffix = tmpSuffix
    }
    
    func createTask() -> URLSessionDataTask {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                if let urlError = error as? URLError, urlError.code == URLError.cancelled {
                    // Do nothing, this is expected since we cancel it
                } else {
                    self.delegate.imageDownloadFailed(sender: self, error: error)
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                // Will never happen
                self.delegate.httpConnectionFailed(sender: self, statusCode: nil)
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                self.delegate.httpConnectionFailed(sender: self, statusCode: httpResponse.statusCode)
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                self.delegate.invalidImageData(sender: self)
                return
            }
            self.delegate.dataSuccess(sender: self, image: image)
            let tmpFile = self.fileName + self.tmpSuffix
            DispatchQueue.global(qos: .utility).async {
                guard !self.fileName.isEmpty && FileManager.default.createFile(atPath: tmpFile, contents: data) else {
                    self.delegate.cantSaveFile(sender: self)
                    return
                }
                var removeTemp = true
                defer {
                    if removeTemp {
                        try? FileManager.default.removeItem(atPath: tmpFile)
                    }
                }
                do {
                    try FileManager.default.moveItem(atPath: tmpFile, toPath: self.fileName)
                    removeTemp = false
                } catch let error as NSError {
                    if error.code == NSFileWriteFileExistsError {
                        // Proceed since this is success
                    } else {
                        self.delegate.cantSaveFile(sender: self)
                        return
                    }
                } catch {
                    self.delegate.cantSaveFile(sender: self)
                    return
                }
                self.delegate.storageSuccess(sender: self)
            }
        }
        return task
    }
}
