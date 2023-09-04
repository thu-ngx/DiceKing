//
//  Round.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 03/09/2023.
//

import Foundation

class Round {
    var startingCoins: Int = 50
    var totalTurns: Int = 3
    var expDiff: Int? = nil

    var turns: [Turn] = [Turn()]

    func getLatestTurn() -> Turn {
        return turns.last!
    }

    func isFinished() -> Bool {
        // Check if all turns are finished
        for turn in turns {
            if !turn.isFinished() {
                return false
            }
        }

        return true
    }
}
