//
//  AudioManager.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 06/09/2023.
//

import Foundation
import AVFAudio

struct AudioManager {
    var audioPlayer: AVAudioPlayer?
    
    mutating func playSound(soundName: String, type: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType: type) else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    mutating func stopSound() {
        audioPlayer?.stop()
    }
}
