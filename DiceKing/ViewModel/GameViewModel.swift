//
//  GameViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var gm = GameManager()
    
    // MARK: Labels
    
    func getStartLabel() -> String {
        return gm.currentRound.isFinished() ? "Start" : "Continue"
    }
    
    func getRollOrBetLabel() -> String {
        return gm.currentRound.turns.last!.isBetted() ? "Roll" : "Bet"
    }
    
    func getTotalBetLabel() -> String {
        return gm.currentRound.turns.last!.betOnEven == nil ? "10" : "15"
    }
    
    // MARK: Other
    
    func isBetted() -> Bool {
        return gm.currentRound.turns.last!.isBetted()
    }
    
    func getOddOrEvenBet() -> Bool? {
        return gm.currentRound.turns.last!.betOnEven
    }

    func setDefaultDices(dices: Int) {
        gm.defaultDices = dices
    }

    func getDices() -> [Int] {
        return gm.currentRound.turns.last!.dices
    }

    func getDefaultDices() -> Int {
        return gm.defaultDices
    }
    
    func resetDiceTypeBet() {
        gm.currentRound.turns.last!.betOnEven = nil
    }
    
    func betOnEvenSum() {
        gm.currentRound.turns.last!.betOnEven = true
    }
    
    func betOnOddSum() {
        gm.currentRound.turns.last!.betOnEven = false
    }
    
    func rollDices() {
        return gm.currentRound.turns.last!.randomizeDices()
    }
    
    func getRanges() -> [[Int]] {
        return gm.currentRound.turns.last!.getRanges()
    }
    
    func getSelectedRange() -> [Int]? {
        return gm.currentRound.turns.last!.selectedRange
    }
    
    func getSelectedRangeIndex() -> Int? {
        return gm.currentRound.turns.last!.getSelectedRangeIndex()
    }
    
    func getLatestTurns() -> [Turn] {
        return gm.currentRound.turns
    }
    
    func getCurrentPoints() -> Int {
        return gm.currentRound.turns.reduce(0, { $0 + $1.point })
    }
    
    func getAllRounds() -> [Round] {
        return gm.pastRounds + [gm.currentRound]
    }
    
    func setSelectedRange(range: [Int]) {
        gm.currentRound.turns.last!.selectedRange = range
    }
    
    func resetAll() {
        gm = GameManager()
    }
}
