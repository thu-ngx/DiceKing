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
        setIsBetted(value: false)
        resetDiceType()
    }
    
    func resetDices() {
        application.dices = Array(repeating: 1, count: application.dices.count)
    }
    
    func resetAll() {
        application = Application()
    }
    
    func randomizeDices() -> Int {
        // randomize dices
        for i in 0..<application.dices.count {
            application.dices[i] = Int.random(in: 1...6)
        }
        
        // return sum of dices
        return application.dices.reduce(0, +)
    }
    
    // MARK: GET RANGE
    
    func getRanges() -> [[Int]] {
        let numberOfRanges = 3
        let dices = application.dices.count
        
        var ranges: [[Int]] = []
        
        // Initialize ranges
        for _ in 0..<numberOfRanges {
            ranges.append([])
        }
        
        let min = dices
        let max = dices * 6
        let diff = max - min
        
        let range = diff / 3
        
        // first range
        ranges[0].append(min)
        ranges[0].append(min + range)
        
        // second range
        ranges[1].append(min + range + 1)
        ranges[1].append(max - range - 1)
        
        // third range
        ranges[2].append(max - range)
        ranges[2].append(max)
        
        return ranges
    }
    
    func rollDices() {
        var coins = 0
        let sum = randomizeDices()
        
        // check if sum is in range
        let ranges = getRanges()
        
        let selectedRange = getSelectedRange()
        let range = ranges[selectedRange]
        
        if sum >= range[0] && sum <= range[1] {
            coins += 10
        } else {
            coins -= 10
        }
        
        // Check if sum is even or odd
        let isEvenNumber = getIsEvenNumber()
        
        if isEvenNumber != nil {
            if (((isEvenNumber  ?? false) && sum % 2 == 0)
                ||
                (!(isEvenNumber ?? false) && sum % 2 != 0)) {
                coins += 5
            } else {
                coins -= 5
            }
        }
        
        // Update round points
        setLastTurn(point: coins)
        setIsBetted(value: false)
    }
    
    // MARK: SETTER
    
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
    
    func setIsBetted(value: Bool) {
        application.isBetted = value
    }
    
    func setLightMode() {
        application.colorScheme = .light
    }
    
    // MARK: ROUND
    func createNewRound() {
        // Reset game state
        application.isBetted = false
        resetDices()
        
        // Add turns to round
        var round = Round()
        round.points = [0, 0, 0]
        
        // Add round to application
        application.rounds.append(round)
    }
    
    func startRound() {
        let lastRound = getLastRound()
        
        if lastRound == nil {
            createNewRound()
        }
    }
    
    func getLastRound() -> Round? {
        for i in (0..<application.rounds.count).reversed() {
            if application.rounds[i].points.contains(0) {
                return application.rounds[i]
            }
        }
        
        // otherwise, return the last round, or nil if there is no round
        return application.rounds.last
    }

    func getIsResumable() -> Bool {
        // Make sure there is a round
        return getLastRound() != nil && 
        // Make sure last round still have some 0-value turns but not all
        getLastRound()!.points.contains(0) &&
        getLastRound()!.points.filter { $0 == 0 }.count != getLastRound()!.points.count
    }
    
    func getCurrentPoint() -> Int {
        let lastRound = getLastRound()
        
        if lastRound != nil {
            return lastRound!.startingPoint + lastRound!.points.reduce(0, +)
        }
        
        return 0
    }

    func getIsWin() -> Bool {
        let lastRound = getLastRound()
        
        // If there is no remaining 0-point turn, the player wins
        if lastRound != nil {
            return !lastRound!.points.contains(0) && getCurrentPoint() > 0
        }
        
        return false
    }
    
    func setLastRound(round: Round?) {
        if round != nil {
            application.rounds[application.rounds.count - 1] = round!
        }
    }
    
    func setLastTurn(point: Int) {
        var lastRound = getLastRound()
        
        if lastRound != nil {
            // Update the first point where its value is 0
            for i in 0..<lastRound!.points.count {
                if lastRound!.points[i] == 0 {
                    lastRound!.points[i] = point
                    break
                }
            }
            
            setLastRound(round: lastRound)
        }
    }
    
    func getRounds() -> [Round] {
        return application.rounds
    }
}
