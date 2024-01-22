//
//  Models.swift
//  abxAudio
//
//  Created by GubarevPN on 11.12.2023.
//

import Foundation

final class TestingState: ObservableObject {
    @Published var currentlyPlayingTrack: TrackCode = .A
    @Published var answersCount: Int = 0
    @Published var correctAnswersCount: Int = 0
    @Published var correctAnswer: TrackCode = .A
}
