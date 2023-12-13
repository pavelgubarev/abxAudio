//
//  ABXTestingView.swift
//  abxAudio
//
//  Created by GubarevPN on 04.12.2023.
//

import SwiftUI
import AVKit

struct ABXTestingView: View {

    let presenter: ABXTestingPresenterProtocol
    @ObservedObject var testingState: TestingState

    var body: some View {
        VStack {
            Text("My score: 3/5").font(.system(size: 30))
            Spacer()
            VStack {
                Text("My guess:").font(.system(size: 30)).padding([.bottom], 20)
                makeAnswerButton(.A)
                .padding([.bottom], 10)

                makeAnswerButton(.B)
            }
            Spacer()
            Text("Currently playing " + testingState.isPlaying.rawValue)
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
    }

    public init(
        presenter: ABXTestingPresenterProtocol,
        testingState: TestingState
    ) {
        self.presenter = presenter
        self.testingState = testingState
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
        ABXTestingView(
            presenter: ABXTestingPresenter(testingState: mockTestingState),
            testingState: mockTestingState
        )
    }
}
