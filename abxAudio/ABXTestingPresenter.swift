//
//  ABXTestingPresenter.swift
//  abxAudio
//
//  Created by GubarevPN on 07.12.2023.
//

import Foundation

public enum TrackCode: String {
    case A
    case B
    case X
}

final class ABXTestingPresenter: ABXTestingPresenterProtocol {

    private var testingState: TestingState

    func didAppear() {
        //
    }

    func didTapPlay(_ track: TrackCode) {
        testingState.isPlaying = TrackCode
    }

    func didTapAnswer(_ track: TrackCode) {

    }

    init(testingState: TestingState) {
        self.testingState = testingState
    }
}
