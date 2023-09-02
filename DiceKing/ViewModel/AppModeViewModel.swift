//
//  AppModeViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation

class AppModeViewModel: ObservableObject {
    @Published var appMode = AppMode(gameMode:"2 dices", colorScheme: .dark)

    // set game mode to 2 dices
    func setGameModeTo2Dices() {
        appMode.gameMode = "2 dices"
    }

    // set game mode to 3 dices
    func setGameModeTo3Dices() {
        appMode.gameMode = "3 dices"
    }

    // set color scheme to dark
    func setColorSchemeToDark() {
        appMode.colorScheme = .dark
    }

    // set color scheme to light
    func setColorSchemeToLight() {
        appMode.colorScheme = .light
    }
}
