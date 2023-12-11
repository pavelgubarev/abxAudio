//
//  ABXTestingPresenter.swift
//  abxAudio
//
//  Created by GubarevPN on 07.12.2023.
//

import Foundation

public enum Track: String {
    case A
    case B
    case X
}

final class ABXTestingPresenter: ABXTestingPresenterProtocol {

    private var testingState: TestingState

    func didAppear() {
        //
    }

    func didTapPlay(_ track: Track) {
        testingState.isPlaying = track
    }

    func didTapAnswer(_ track: Track) {

    }

    init(testingState: TestingState) {
        self.testingState = testingState
    }
}
