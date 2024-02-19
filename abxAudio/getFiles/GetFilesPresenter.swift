//
//  getFilesPresenter.swift
//  abxAudio
//
//  Created by GubarevPN on 12.02.2024.
//

import Foundation

final class GetFilesPresenter: GetFilesPresenterProtocol {

    private weak var interactor: GetFilesInteractorProtocol?
    private weak var view: GetFilesViewProtocol?

    init(
        interactor: GetFilesInteractorProtocol,
        view: GetFilesViewProtocol
    ) {
        self.interactor = interactor
        self.view = view
    }

    func downloadDemoFiles() {
        view?.showProgress()
        interactor?.downloadAFile(
            url: "http://gubarev.ru/abxSamples/Time-30.m4a",
            delegate: FileDownloadingPresenter(trackCode: .A)
        )
        interactor?.downloadAFile(
            url: "http://gubarev.ru/abxSamples/Time-50.m4a",
            delegate: FileDownloadingPresenter(trackCode: .B)
        )
    }
}

final class FileDownloadingPresenter: FileDownloadingDelegate {

    private let trackCode: TrackCode

    init(trackCode: TrackCode) {
        self.trackCode = trackCode
    }

    func updateDownloadProgressWith(progress: Float) {

    }

    func downloadFinished(localFilePath: URL) {
    }

    func downloadFailed(withError error: Error) {
    }
}

