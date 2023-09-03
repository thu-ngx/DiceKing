//
//  ApplicationViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation
import SwiftUI

class ApplicationViewModel: ObservableObject {
    @Published var application = Application()

    // MARK: GETTER

    func getDices() -> [Int] {
        return application.dices
    }

    func getSelectedRange() -> Int {
        print("selected range: \(application.selectedRange)")
        return application.selectedRange
    }

    func getIsEvenNumber() -> Bool? {
        return application.isEvenNumber
    }

    func getIsBetted() -> Bool {
        return application.isBetted
    }

    func getColorScheme() -> ColorScheme {
        return application.colorScheme
    }

    func setDices(dices: Int) {
        application.dices = Array(repeating: 1, count: dices)
    }

    func resetDices() {
        application.dices = Array(repeating: 1, count: application.dices.count)
    }

    func randomizeDices() {
        for i in 0..<application.dices.count {
            application.dices[i] = Int.random(in: 1...6)
        }
    }

    func setSelectedRange(num: Int) {
        application.selectedRange = num
    }

    func resetDiceType() {
        application.isEvenNumber = nil
    }

    func setEvenNumber() {
        application.isEvenNumber = true
    }

    func setOddNumber() {
        application.isEvenNumber = false
    }

    func setDarkMode() {
        application.colorScheme = .dark
    }

    func setIsBetted() {
        application.isBetted = true
    }

    func setLightMode() {
        application.colorScheme = .light
    }

    // MARK: ROUND

    func createNewRound() {
        application.rounds.append(Round())
    }

    func startRound() -> Round? {
        let lastRound = getLastRound()

        if lastRound == nil {
            createNewRound()
        }

        return getLastRound()
    }

    func getLastRound() -> Round? {
        return application.rounds.last(where: { $0.isWon == nil })
    }

    func getRounds() -> [Round] {
        return application.rounds
    }
}
