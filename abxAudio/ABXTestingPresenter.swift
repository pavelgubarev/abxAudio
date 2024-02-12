//
//  ABXTestingPresenter.swift
//  abxAudio
//
//  Created by GubarevPN on 07.12.2023.
//

import Foundation

public enum TrackCode: String, CaseIterable {
    case A
    case B
    case X
}

final class ABXTestingPresenter: ABXTestingPresenterProtocol {
    
    private var testingState: TestingState
    private var audioPlayers = [TrackCode: AudioPlayer]()

    init(testingState: TestingState, tracksToTest: [TrackCode: String]) {
        self.testingState = testingState
        setInitialState(tracksToTest: tracksToTest)
    }

    func didAppear() {
        setNextCorrectAnswer()
    }

    func didTapPlay(_ chosenTrack: TrackCode) {
        var trackToPlay: TrackCode

        if chosenTrack == .X {
            trackToPlay = testingState.correctAnswer
        } else {
            trackToPlay = chosenTrack
        }

        testingState.userChosenTrack = chosenTrack

        for code in [TrackCode.A, TrackCode.B] {
            if code == trackToPlay {
                audioPlayers[code]?.playOrPause()
            } else {
                audioPlayers[code]?.pause()
            }
        }
    }

    func didTapAnswer(_ answer: TrackCode) {
        testingState.answersCount += 1
        if answer == testingState.correctAnswer {
            testingState.correctAnswersCount += 1
        }

        setNextCorrectAnswer()
    }

    func didChangeSliderProgress(to progress: Double) {
        syncProgress(to: progress)
    }

    private func syncProgress(to progress: Double) {
        audioPlayers.values.forEach { player in
            player.setProgress(progress)
        }
    }

    public func getAudioPlayer(for track: TrackCode) -> AudioPlayer {
        guard let player = audioPlayers[track] else {
            assertionFailure("Не был создан плеер")
            return AudioPlayer(fileName: "")
        }
        return player
    }

    private func setNextCorrectAnswer() {
        testingState.correctAnswer = Bool.random() ? .A : .B
    }

    private func setInitialState(tracksToTest: [TrackCode: String]) {
        guard let fileA = tracksToTest[.A],
              let fileB = tracksToTest[.B]
        else {
            assertionFailure("No files to test")
            return
        }

        audioPlayers[.A] = AudioPlayer(fileName: fileA)
        audioPlayers[.B] = AudioPlayer(fileName: fileB)
    }
}
