//
//  Dowloader.swift
//  abxAudio
//
//  Created by GubarevPN on 12.02.2024.
//

import Foundation

protocol FileDownloadingDelegate: AnyObject {
    func updateDownloadProgressWith(progress: Float)
    func downloadFinished(localFilePath: URL)
    func downloadFailed(withError error: Error)
}

class FileDownloader: NSObject, URLSessionDownloadDelegate {
    
    private weak var delegate: FileDownloadingDelegate?

    func download(from url: URL, delegate: FileDownloadingDelegate) {
        self.delegate = delegate
        let sessionConfig = URLSessionConfiguration.background(withIdentifier: url.absoluteString) 
        let session = Foundation.URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        let task = session.downloadTask(with: url)
        task.resume()
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        DispatchQueue.main.async { self.delegate?.downloadFinished(localFilePath: location) }
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        DispatchQueue.main.async { self.delegate?.updateDownloadProgressWith(progress: Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)) }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let theError = error else { assertionFailure("something weird happened here"); return }
        DispatchQueue.main.async { self.delegate?.downloadFailed(withError: theError) }
    }
}
