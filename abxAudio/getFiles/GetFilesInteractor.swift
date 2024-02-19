//
//  getFilesInteractor.swift
//  abxAudio
//
//  Created by GubarevPN on 12.02.2024.
//

import Foundation

final class GetFilesinteractor: GetFilesInteractorProtocol {

    func downloadAFile(url: String, delegate: FileDownloadingDelegate) {
        let downloader = FileDownloader()

        guard let url = URL(string: url) else { return }

        downloader.download(from: url, delegate: delegate)
    }
}
