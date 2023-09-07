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
    
    func getBetRangeLabel() -> String {
        let betRange = getRangeLabel()
        return "Betted on range: \(betRange)"
    }
    
    func getBetTypeLabel() -> String {
        let betType = getOddOrEvenLabel()
        return "(\(betType) sum)"
    }
    
    func getDicesLabel() -> String {
        return gm.currentRound.turns.last?.dices.map({ String($0) }).joined(separator: " ") ?? "1"
    }
    
    func getPointLabel() -> String {
        return String(gm.currentRound.turns.last?.point ?? 0)
    }
    
    func getOddOrEvenLabel() -> String {
        return gm.currentRound.turns.last?.betOnEven == nil ? "All" : gm.currentRound.turns.last!.betOnEven! ? "Even" : "Odd"
    }
    
    func getRangeLabel() -> String {
        return gm.currentRound.turns.last?.selectedRange == nil ? "No range selected" : "\(gm.currentRound.turns.last!.selectedRange![0]) - \(gm.currentRound.turns.last!.selectedRange![1])"
    }
    
    func getTurnsLabel() -> String {
        return String(gm.currentRound.turns.count)
    }
    
    func getIsBettedLabel() -> String {
        return gm.currentRound.turns.last?.isBetted == true ? "Yes" : "No"
    }
    
    func getWinExpLabel() -> String {
        return String(Constants.expPerWin)
    }
    
    func getLoseExpLabel() -> String {
        return String(Constants.expPerLose)
    }
    
    // MARK: Other
    
    func isAnimationEnabled() -> Bool {
        return gm.enableAnimation
    }
    
    func getRanges() -> [[Int]] {
        let numberOfRanges = 3
        
        let dices = gm.currentRound.turns.last?.dices.count ?? 0
        
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
        guard let selectedRange = gm.currentRound.turns.last?.selectedRange else {
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
    
    func isDefault() -> Bool {
        return gm.defaultDices == 1
    }
    
    func resetDiceTypeBet() {
        let lastTurnIndex = getLastTurnIndex()
        gm.currentRound.turns[lastTurnIndex].betOnEven = nil
    }
    
    func betOnEvenSum() {
        let lastTurnIndex = getLastTurnIndex()
        gm.currentRound.turns[lastTurnIndex].betOnEven = true
    }
    
    func betOnOddSum() {
        let lastTurnIndex = getLastTurnIndex()
        gm.currentRound.turns[lastTurnIndex].betOnEven = false
    }
    
    func handleAutoBet() {
        if !gm.autoBet {
            return
        }
        
        // Randomly choose a range
        let rangeIndex = Int.random(in: 0..<getRanges().count)
        let range = getRanges()[rangeIndex]
        
        // Randomly choose odd or even, or nil
        let oddOrEven = Int.random(in: 0...2) == 0 ? true : Int.random(in: 0...2) == 0 ? false : nil
        
        // Set the range and odd or even
        let lastTurnIndex = getLastTurnIndex()
        
        gm.currentRound.turns[lastTurnIndex].selectedRange = range
        gm.currentRound.turns[lastTurnIndex].betOnEven = oddOrEven
        gm.currentRound.turns[lastTurnIndex].isBetted = true
    }
    
    func isAutoBet() -> Bool {
        return gm.autoBet
    }
    
    func useManualBet() {
        gm.autoBet = false
    }
    
    func useAutoBet() {
        gm.autoBet = true
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
    
    func finalizeTurn(db: DatabaseViewModel, audio: AudioViewModel, level: Int, turnIndex: Int) {
        let sum = gm.currentRound.turns[turnIndex].dices.reduce(0, { $0 + $1 })
        var coins = 0
        
        // Check if bet on range
        if let selectedRange = gm.currentRound.turns[turnIndex].selectedRange
            ?? getRanges().first
        {
            let coinDiff = db.getRangeBet(level: level)
            
            if sum >= selectedRange[0] && sum <= selectedRange[1] {
                coins += coinDiff
            } else {
                coins -= coinDiff
            }
        }
        
        // Check if bet on even sum
        if let betOnEven = gm.currentRound.turns[turnIndex].betOnEven {
            let coinDiff = db.getOddOrEvenBet(level: level)
            
            if ((sum % 2 == 0 && betOnEven) || (sum % 2 != 0 && !betOnEven)) {
                coins += coinDiff
            } else {
                coins -= coinDiff
            }
        }
        
        // Update coins
        gm.currentRound.turns[turnIndex].point = coins
        
        if coins > 0 {
            audio.playRoundWonSound()
        } else {
            audio.playRoundLostSound()
        }
    }
    
    func rollDices(db: DatabaseViewModel, audio: AudioViewModel, level: Int, turnIndex: Int) {
        // Start the turn animation
        startAnimating(turnIndex: turnIndex)
        
        // initialize a new .now() every time the function is called
        let now = DispatchTime.now()
        
        if (gm.enableAnimation) {
            for i in 0..<(Constants.animationTurns + 1) {
                let isDelayed = i == Constants.animationTurns
                let delay = isDelayed ? Constants.delayAfterAnimation : 0
                let duration = Double(i) * Constants.animationDuration + delay
                
                DispatchQueue.main.asyncAfter(deadline: now + duration) {
                    // If it's the last turn, finish the turn after the animation is done
                    if isDelayed {
                        self.finalizeTurn(db: db, audio: audio, level: level, turnIndex: turnIndex)
                        self.stopAnimating(turnIndex: turnIndex)
                    } else {
                        self.randomizeDices(turnIndex: turnIndex)
                    }
                }
            }
        } else {
            self.randomizeDices(turnIndex: turnIndex)
            self.finalizeTurn(db: db, audio: audio, level: level, turnIndex: turnIndex)
            self.stopAnimating(turnIndex: turnIndex)
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
    
    func getTurnsCount(db: DatabaseViewModel, level: Int) -> Int {
        return db.getTurnsCount(level: level)
    }
    
    func getStartingCoins(db: DatabaseViewModel, level: Int) -> Int {
        return db.getStartingCoins(level: level)
    }
    
    func createNewRound(db: DatabaseViewModel, user: User) -> Round {
        let lastRound = user.rounds.last
        let (level, _) = db.getLevel(exp: user.exp)
        
        let newStartingCoins = getStartingCoins(db: db, level: level)
        let newTotalTurns = getTurnsCount(db: db, level: level)
        let newTurns = [createNewTurn(dices: lastRound?.turns.last?.dices)]
        
        // Create a new round with the same starting coins and total turns as the last round if it's not the first round
        // else create a new round with the default starting coins and total turns
        return Round(
            turns: newTurns,
            startingCoins: newStartingCoins,
            totalTurns: newTotalTurns
        )
    }
    
    func setupRound(db: DatabaseViewModel, round: Round, user: User) {
        // If it's the first round, create a new round
        if user.rounds.count == 0 {
            let newRound = createNewRound(db: db, user: user)
            gm.currentRound = newRound
        }
        
        // If it's not the first round, load the last round
        else {
            gm.currentRound = round
        }
    }

    func startNewRound(db: DatabaseViewModel, app: ApplicationViewModel) {
        app.addRound(round: gm.currentRound)
        
        let newRound = createNewRound(db: db, user: app.getUser()!)
        gm.currentRound = newRound
    }
    
    func startNewTurn(db: DatabaseViewModel, app: ApplicationViewModel) {
        // If current turn is still less than total turns, create a new turn
        if gm.currentRound.turns.count < gm.currentRound.totalTurns {
            let newTurn = createNewTurn(dices: nil)
            gm.currentRound.turns.append(newTurn)
        }
        
        // If current turn is equal to total turns, create a new round
        else {
            startNewRound(db: db, app: app)
        }
    }
    
    func handleRoundEnd(db: DatabaseViewModel, app: ApplicationViewModel, exp: Int) {
        app.addUserExp(exp: exp)
        gm.currentRound.bonusExp = exp
        
        // Check for badges
        let user = app.getUser()!
        let badges = db.getBadges()

        let lastRound = gm.currentRound
        let turns = lastRound.turns
        let has3Turns = turns.count >= 3

        print("Checking for badges...")
        print("Dices: \(getDicesLabel())")
        
        // Check for NEWBIE badge
        if !app.hasBadge(id: "NEWBIE") {
            app.addBadge(id: "NEWBIE")
            print("Added NEWBIE badge")
        }
        
        // Check for GRANDMASTER badge
        if !app.hasBadge(id: "GRANDMASTER") {
            let (level, _) = db.getLevel(exp: user.exp)
            if level >= 5 {
                app.addBadge(id: "GRANDMASTER")
                print("Added GRANDMASTER badge")
            }
        }
        
        // Check for Lucky 7 badge
        if !app.hasBadge(id: "LUCKY7") {
            // Check if any turn's dice sum is 7
            if turns.contains(where: { $0.dices.reduce(0, { $0 + $1 }) == 7 }) {
                app.addBadge(id: "LUCKY7")
                print("Added LUCKY7 badge")
            }
        }
        
        // Check for Snake Eyes badge
        if !app.hasBadge(id: "SNAKE_EYES") {
            // Check if any turn has dice sum of 2 and only 2 dices
            if turns.contains(where: { $0.dices.reduce(0, { $0 + $1 }) == 2 && $0.dices.count == 2 }) {
                app.addBadge(id: "SNAKE_EYES")
                print("Added SNAKE_EYES badge")
            }
        }
        
        // Check for Victorious badge
        if !app.hasBadge(id: "VICTORIOUS") && has3Turns {
            // Check if there is any 3 consecutive turns with point > 0
            for i in 0..<(turns.count - 2) {
                if turns[i].point > 0
                    && turns[i + 1].point > 0
                    && turns[i + 2].point > 0
                {
                    app.addBadge(id: "VICTORIOUS")
                    print("Added VICTORIOUS badge")
                    break
                }
            }
        }
        
        // Check for Straight Dices badge
        if !app.hasBadge(id: "STRAIGHT_DICES") && has3Turns {
            // Check if there is 3 consecutive turns with dices in sequence (e.g. 3-4-5)
            for i in 0..<(turns.count - 2) {
                let dices = turns[i].dices
                let nextDices = turns[i + 1].dices
                let nextNextDices = turns[i + 2].dices
                
                if dices[0] + 1 == nextDices[0]
                    && nextDices[0] + 1 == nextNextDices[0]
                {
                    app.addBadge(id: "STRAIGHT_DICES")
                    print("Added STRAIGHT_DICES badge")
                    break
                }
            }
        }

        startNewRound(db: db, app: app)
    }
    
    func handleRoundWin(db: DatabaseViewModel, app: ApplicationViewModel) {
        let exp = Constants.expPerWin
        handleRoundEnd(db: db, app: app, exp: exp)
    }
    
    func handleRoundLose(db: DatabaseViewModel, app: ApplicationViewModel) {
        let exp = Constants.expPerLose
        handleRoundEnd(db: db, app: app, exp: exp)
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
        gm.defaultDices = 1
    }
}
