//
//  abxAudioProtocols.swift
//  abxAudio
//
//  Created by GubarevPN on 07.12.2023.
//

import Foundation

protocol ABXTestingPresenterProtocol {
    func didAppear()
    func didTapPlay(_ track: Track)
    func didTapAnswer(_ track: Track)
}

protocol ABXTestingViewProtocol {
    func play(_ track: Track)
}
