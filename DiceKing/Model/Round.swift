//
//  Round.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 03/09/2023.
//

import Foundation

struct Round {
    var turns: [Turn] = []
    var startingCoins: Int = 50
    var totalTurns: Int = 3
    var bonusExp: Int? = nil
}
