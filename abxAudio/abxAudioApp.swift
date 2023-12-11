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
            var testingState = TestingState()
            ABXTestingView(
                presenter: ABXTestingPresenter(testingState: testingState),
                testingState: testingState
            )
        }
    }
}
