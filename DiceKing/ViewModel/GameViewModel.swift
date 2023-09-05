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
        // If all turns have point == 0 and is not betted, return "Start"
        // Else return "Continue"
        for turn in gm.currentRound.turns {
            if turn.point != 0 || turn.isBetted {
                return "Continue"
            }
        }
        
        return "Start"
    }
    
    func getRollOrBetLabel() -> String {
        // If last turn is betted and has point != 0, return "Continue"
        // Else return "Roll" or "Bet" depending on whether last turn is betted
        let lastTurnIndex = getLastTurnIndex()
        let lastTurn = gm.currentRound.turns[lastTurnIndex]
        
        if lastTurn.isAnimating {
            return "Rolling..."
        } else if lastTurn.isBetted && lastTurn.point != 0 {
            return "Continue"
        } else if lastTurn.isBetted {
            return "Roll"
        } else {
            return "Bet"
        }
    }
    
    func getTotalBetLabel() -> String {
        let betValue = gm.currentRound.turns.last!.betOnEven == nil ? "10" : "15"
        return betValue
    }
    
    func getBetRangeLabel() -> String {
        let betRange = getRangeLabel()
        return "Betted on range: \(betRange)"
    }
    
    func getBetTypeLabel() -> String {
        let betType = getOddOrEvenLabel()
        return "(\(betType) sum)"
    }
    
    func getDicesLabel() -> String {
        return gm.currentRound.turns.last!.dices.map({ String($0) }).joined(separator: " ")
    }
    
    func getPointLabel() -> String {
        return String(gm.currentRound.turns.last!.point)
    }
    
    func getOddOrEvenLabel() -> String {
        return gm.currentRound.turns.last!.betOnEven == nil ? "All" : gm.currentRound.turns.last!.betOnEven! ? "Even" : "Odd"
    }
    
    func getRangeLabel() -> String {
        return gm.currentRound.turns.last!.selectedRange == nil ? "No range selected" : "\(gm.currentRound.turns.last!.selectedRange![0]) - \(gm.currentRound.turns.last!.selectedRange![1])"
    }
    
    func getTurnsLabel() -> String {
        return String(gm.currentRound.turns.count)
    }
    
    func getIsBettedLabel() -> String {
        return gm.currentRound.turns.last!.isBetted ? "Yes" : "No"
    }
    
    // MARK: Other
    
    func getRanges() -> [[Int]] {
        let numberOfRanges = 3
        
        let dices = gm.currentRound.turns.last!.dices.count
        
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
    
    func getSelectedRangeIndex() -> Int? {
        guard let selectedRange = gm.currentRound.turns.last!.selectedRange else {
            return nil
        }
        
        let ranges = getRanges()
        
        for i in 0..<ranges.count {
            if ranges[i] == selectedRange {
                return i
            }
        }
        
        return nil
    }
    
    func isBetted() -> Bool {
        return gm.currentRound.turns.last!.isBetted
    }
    
    func isTurnCompleted() -> Bool {
        return gm.currentRound.turns.last!.point != 0
    }
    
    func isCompleted() -> Bool {
        return gm.currentRound.turns.count == gm.currentRound.totalTurns
    }
    
    func isWon() -> Bool {
        if gm.currentRound.turns.count < gm.currentRound.totalTurns {
            return false
        }
        
        // round is won if all turns have point != 0, the last turn is betted, and sum of all turns' points plus starting coins is greater than 0
        let totalPoints = gm.currentRound.turns.reduce(0, { $0 + $1.point })
        return gm.currentRound.turns.last!.isBetted && totalPoints + gm.currentRound.startingCoins > 0
    }
    
    func getOddOrEvenBet() -> Bool? {
        return gm.currentRound.turns.last!.betOnEven
    }
    
    func getLastTurnIndex() -> Int {
        return gm.currentRound.turns.count - 1
    }
    
    func setDefaultDices(dices: Int) {
        gm.defaultDices = dices
        
        let lastTurnIndex = getLastTurnIndex()
        
        gm.currentRound.turns[lastTurnIndex].dices = Array(repeating: 1, count: dices)
        gm.currentRound.turns[lastTurnIndex].isAnimating = false
        gm.currentRound.turns[lastTurnIndex].isBetted = false
        gm.currentRound.turns[lastTurnIndex].selectedRange = nil
        gm.currentRound.turns[lastTurnIndex].betOnEven = nil
        gm.currentRound.turns[lastTurnIndex].point = 0
    }
    
    func getDices() -> [Int] {
        return gm.currentRound.turns.last!.dices
    }
    
    func getDiceNames(turnIndex: Int) -> [String] {
        var names: [String] = []
        
        for dice in gm.currentRound.turns[turnIndex].dices {
            names.append("Dice \(dice)")
        }
        
        return names
    }
    
    func getDefaultDices() -> Int {
        return gm.defaultDices
    }
    
    func resetDiceTypeBet() {
        let lastTurnIndex = getLastTurnIndex()
        gm.currentRound.turns[lastTurnIndex].selectedRange = nil
    }
    
    func betOnEvenSum() {
        let lastTurnIndex = getLastTurnIndex()
        gm.currentRound.turns[lastTurnIndex].betOnEven = true
    }
    
    func betOnOddSum() {
        let lastTurnIndex = getLastTurnIndex()
        gm.currentRound.turns[lastTurnIndex].betOnEven = false
    }
    
    func randomizeDices(turnIndex: Int) {
        // Randomize dices
        for i in 0..<gm.currentRound.turns[turnIndex].dices.count {
            gm.currentRound.turns[turnIndex].dices[i] = Int.random(in: 1...6)
        }
    }
    
    func startAnimating(turnIndex: Int) {
        gm.currentRound.turns[turnIndex].isAnimating = true
    }
    
    func stopAnimating(turnIndex: Int) {
        gm.currentRound.turns[turnIndex].isAnimating = false
    }
    
    func finalizeTurn(turnIndex: Int) {
        let sum = gm.currentRound.turns[turnIndex].dices.reduce(0, { $0 + $1 })
        var point = 0
        
        // Check if bet on range
        if let selectedRange = gm.currentRound.turns[turnIndex].selectedRange
            ?? getRanges().first
        {
            if sum >= selectedRange[0] && sum <= selectedRange[1] {
                point += 10
            } else {
                point -= 10
            }
        }
        
        // Check if bet on even sum
        if let betOnEven = gm.currentRound.turns[turnIndex].betOnEven {
            if sum % 2 == 0 && betOnEven {
                point += 5
            } else if sum % 2 != 0 && !betOnEven {
                point += 5
            } else {
                point -= 5
            }
        }
        
        // Update point
        gm.currentRound.turns[turnIndex].point = point
    }
    
    func rollDices(turnIndex: Int) {
        // Use DispatchQueue to delay the randomization of dices with combination of for loop and random values
        // to create an animation effect
        let animationTurns = 20
        let animationDuration = 0.1
        let delayAfterAnimation = 0.5
        
        // Start the turn animation
        startAnimating(turnIndex: turnIndex)
        
        // initialize a new .now() every time the function is called
        let now = DispatchTime.now()
        
        for i in 0..<(animationTurns + 1) {
            let isDelayed = i == animationTurns
            let delay = isDelayed ? delayAfterAnimation : 0
            let duration = Double(i) * animationDuration + delay
            
            DispatchQueue.main.asyncAfter(deadline: now + duration) {
                // If it's the last turn, finish the turn after the animation is done
                if isDelayed {
                    self.finalizeTurn(turnIndex: turnIndex)
                    self.stopAnimating(turnIndex: turnIndex)
                } else {
                    self.randomizeDices(turnIndex: turnIndex)
                }
            }
        }
    }
    
    func createNewTurn(dices: [Int]?) -> Turn {
        // create a new turn with the dices used from gm.defaultDices if it's the first turn
        // else create a new turn with the dices used from the last turn
        return Turn(
            dices: dices ?? (gm.currentRound.turns.count == 0
                             ? Array(repeating: 1, count: gm.defaultDices)
                             : gm.currentRound.turns.last!.dices)
        )
    }
    
    func createNewRound() -> Round {
        let lastRound = gm.pastRounds.last
        
        let newStartingCoins = lastRound?.startingCoins ?? 50
        let newTotalTurns = lastRound?.totalTurns ?? 3
        let newTurns = [createNewTurn(dices: lastRound?.turns.last?.dices)]
        
        // Create a new round with the same starting coins and total turns as the last round if it's not the first round
        // else create a new round with the default starting coins and total turns
        return Round(
            turns: newTurns,
            startingCoins: newStartingCoins,
            totalTurns: newTotalTurns
        )
    }
    
    func startNewTurn() {
        // If current turn is still less than total turns, create a new turn
        if gm.currentRound.turns.count < gm.currentRound.totalTurns {
            let newTurn = createNewTurn(dices: nil)
            gm.currentRound.turns.append(newTurn)
        }
        
        // If current turn is equal to total turns, create a new round
        else {
            gm.pastRounds.append(gm.currentRound)
            
            let newRound = createNewRound()
            gm.currentRound = newRound
        }
    }
    
    func getSelectedRange() -> [Int]? {
        return gm.currentRound.turns.last!.selectedRange
    }
    
    func getLatestTurns() -> [Turn] {
        return gm.currentRound.turns
    }
    
    func getLastPlayedTurn() -> Turn? {
        // If there is only 1 turn, return that turn
        if gm.currentRound.turns.count == 1 {
            return gm.currentRound.turns[0]
        }
        
        // If there are more than 1 turn, return the last turn that has point != 0,
        // or the last turn if all turns have point == 0
        for i in (0..<gm.currentRound.turns.count).reversed() {
            if gm.currentRound.turns[i].point != 0 {
                return gm.currentRound.turns[i]
            }
        }
        
        return gm.currentRound.turns.last
    }
    
    func getCurrentPoints() -> Int {
        let coins = gm.currentRound.startingCoins
        let coinsDiff = gm.currentRound.turns.reduce(0, { $0 + $1.point })
        
        return coins + coinsDiff
    }
    
    func getAllRounds() -> [Round] {
        return gm.pastRounds + [gm.currentRound]
    }
    
    func setSelectedRange(range: [Int]) {
        let lastTurnIndex = getLastTurnIndex()
        gm.currentRound.turns[lastTurnIndex].selectedRange = range
    }
    
    func completeBetting() {
        let lastTurnIndex = getLastTurnIndex()
        
        // If current turn's selected range isn't set, set it to the first range
        if gm.currentRound.turns[lastTurnIndex].selectedRange == nil {
            gm.currentRound.turns[lastTurnIndex].selectedRange = getRanges().first
        }
        
        gm.currentRound.turns[lastTurnIndex].isBetted = true
    }
    
    func resetAll() {
        gm = GameManager()
    }
}
