//
//  AudioPlayer.swift
//  abxAudio
//
//  Created by GubarevPN on 17.01.2024.
//

import AVFoundation

class AudioPlayer {
    
    var audioPlayer: AVAudioPlayer?
    var isPlaying = false

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
}
