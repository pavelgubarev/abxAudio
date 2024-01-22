//
//  abxAudioApp.swift
//  abxAudio
//
//  Created by GubarevPN on 04.12.2023.
//

import SwiftUI

@main
struct abxAudioApp: App {
    var body: some Scene {
        WindowGroup {

            // hardcode so far
            let testingState = TestingState()
            let tracksToCompare = [TrackCode.A: "Time-30", TrackCode.B: "Time-50"]

            let presenter = ABXTestingPresenter(testingState: testingState, tracksToTest: tracksToCompare)

            ABXTestingView(
                presenter: presenter,
                testingState: testingState
            )
        }
    }
}
