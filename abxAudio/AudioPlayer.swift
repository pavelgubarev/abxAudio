//
//  AudioPlayer.swift
//  abxAudio
//
//  Created by GubarevPN on 17.01.2024.
//

import AVFoundation

class AudioPlayer: ObservableObject {
    
    var audioPlayer: AVAudioPlayer?
    var isPlaying = false
    @Published var progress: Double = 0 {
        didSet {
            setCurrentTime()
        }
    }
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(fileName: String) {
        if let file = Bundle.main.path(forResource: "testFiles/" + fileName, ofType: "m4a") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: file))
            } catch {
                print("AVAudioPlayer could not be created.")
            }
        } else {
            print("File not found")
        }
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.updateProgress()
        }
    }

    private func updateProgress() {
        guard let currentTime = audioPlayer?.currentTime,
              let duration = audioPlayer?.duration else
        { return }

        progress = currentTime / duration
    }

    private func setCurrentTime() {
        guard let duration = audioPlayer?.duration else
        { return }

        audioPlayer?.currentTime = duration * progress
    }

    func playOrPause() {
        guard let player = audioPlayer else { return }

        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying = !isPlaying
    }

    func pause() {
        guard let player = audioPlayer, player.isPlaying else { return }

        player.pause()
        isPlaying = false
    }
}
