//
//  abxAudioProtocols.swift
//  abxAudio
//
//  Created by GubarevPN on 07.12.2023.
//

import Foundation

protocol ABXTestingPresenterProtocol {
    func didAppear()
    func didTapPlay(_ track: TrackCode)
    func didTapAnswer(_ track: TrackCode)
}

protocol ABXTestingViewProtocol {
    func play(_ track: TrackCode)
}
