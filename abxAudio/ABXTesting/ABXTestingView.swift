//
//  ABXTestingView.swift
//  abxAudio
//
//  Created by GubarevPN on 04.12.2023.
//

import SwiftUI
import AVKit

struct ABXTestingView: View {

    private let presenter: ABXTestingPresenterProtocol
    @ObservedObject private var testingState: TestingState
    @ObservedObject private var audioPlayerA: AudioPlayer
    @ObservedObject private var audioPlayerB: AudioPlayer
    private var players = [TrackCode: AudioPlayer]()
    @State private var sliderProgress: Double = 0

    var actuallyPlayingTrack: TrackCode {
        if testingState.userChosenTrack == .X {
            return testingState.correctAnswer
        } else {
            return testingState.userChosenTrack
        }
    }

    var body: some View {
        VStack {
            Text(makeMyScoreText()).font(.system(size: 30))
            Spacer()
            VStack {
                Text("My guess:").font(.system(size: 30)).padding([.bottom], 20)
                makeAnswerButton(.A)
                .padding([.bottom], 10)

                makeAnswerButton(.B)
            }
            Spacer()
            VStack {
                Text("Currently playing " + testingState.userChosenTrack.rawValue)
                Slider(value: $sliderProgress, in: 0.0...1, step: 0.05) { _ in
                    presenter.didChangeSliderProgress(to: sliderProgress)
                }
                .padding([.leading, .trailing], 20)
            }
            Spacer()
            HStack {
                makePlayButton(.A)
                Spacer()
                makePlayButton(.B)
                Spacer()
                makePlayButton(.X)
            }.frame(maxWidth: .infinity)
                .padding(20)
        }.onAppear {
            presenter.didAppear()
        }
        .onChange(of: players[actuallyPlayingTrack]?.progress ?? 0.0) { newValue in
            sliderProgress = newValue
        }
    }

    public init(
        presenter: ABXTestingPresenterProtocol,
        testingState: TestingState
    ) {
        self.presenter = presenter
        self.testingState = testingState

        audioPlayerA = presenter.getAudioPlayer(for: .A)
        audioPlayerB = presenter.getAudioPlayer(for: .B)
        players[.A] = audioPlayerA
        players[.B] = audioPlayerB
    }

    private func makeMyScoreText() -> String {
        return "My Score: "
        + String(testingState.correctAnswersCount)
        + "/"
        + String(testingState.answersCount)
    }

    private func makeAnswerButton(_ answer: TrackCode) -> some View {
        return Button(action: { presenter.didTapAnswer(answer)}) {
            Text("X is " + answer.rawValue).font(.system(size: 30))
        }
    }

    private func makePlayButton(_ TrackCode: TrackCode) -> some View {
        Button(action: { presenter.didTapPlay(TrackCode)}) {
            Text("Play " + TrackCode.rawValue).font(.system(size: 30))
        }
    }
}

struct ABXTestingView_Previews: PreviewProvider {
    static var previews: some View {
        let mockTestingState = TestingState()
        let tracksToCompare = [TrackCode.A: "Time-30", TrackCode.B: "Time-50"]

        ABXTestingView(
            presenter: ABXTestingPresenter(testingState: mockTestingState, tracksToTest: tracksToCompare),
            testingState: mockTestingState
        )
    }
}