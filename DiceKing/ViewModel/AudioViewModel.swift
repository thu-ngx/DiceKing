//
//  AudioViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 06/09/2023.
//

import Foundation

class AudioViewModel: ObservableObject {
    @Published var bgmAudio = AudioManager()
    @Published var gameAudio = AudioManager()
    @Published var sfxAudio = AudioManager()

    @Published var isAudioEnabled = true

    init() {
        bgmAudio.audioPlayer?.volume = 0.8
        gameAudio.audioPlayer?.volume = 0.8
        sfxAudio.audioPlayer?.volume = 0.8
    }

    func disableAudio() {
        bgmAudio.audioPlayer?.volume = 0
        gameAudio.audioPlayer?.volume = 0
        sfxAudio.audioPlayer?.volume = 0
        isAudioEnabled = false
    }

    func enableAudio() {
        bgmAudio.audioPlayer?.volume = 0.8
        gameAudio.audioPlayer?.volume = 0.8
        sfxAudio.audioPlayer?.volume = 0.8
        isAudioEnabled = true
    }

    func isBGMPlaying() -> Bool {
        return bgmAudio.audioPlayer?.isPlaying ?? false
    }

    func isSFXPlaying() -> Bool {
        return sfxAudio.audioPlayer?.isPlaying ?? false
    }

    func isGameAudioPlaying() -> Bool {
        return gameAudio.audioPlayer?.isPlaying ?? false
    }

    func playBGM() {
        bgmAudio.playSound(soundName: "background", type: "mp3")
        bgmAudio.audioPlayer?.numberOfLoops = -1
    }

    func stopBGM() {
        bgmAudio.stopSound()
    }

    func stopSFX() {
        sfxAudio.stopSound()
    }

    func stopGameAudio() {
        gameAudio.stopSound()
    }

    func playClickSound() {
        sfxAudio.playSound(soundName: "click", type: "wav")
    }

    func playRollSound() {
        gameAudio.playSound(soundName: "rolling", type: "wav")
    }

    func playRoundWonSound() {
        gameAudio.playSound(soundName: "round-won", type: "wav")
    }

    func playGameWonSound() {
        sfxAudio.playSound(soundName: "game-won", type: "wav")
    }

    func playRoundLostSound() {
        gameAudio.playSound(soundName: "round-lost", type: "mp3")
    }

    func playGameLostSound() {
        sfxAudio.playSound(soundName: "game-lost", type: "mp3")
    }
}
