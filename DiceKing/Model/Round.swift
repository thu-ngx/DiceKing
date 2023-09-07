//
//  Round.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 03/09/2023.
//

import Foundation

struct Round: Codable {
    var turns: [Turn] = []
    var startingCoins: Int = 50
    var totalTurns: Int = 3
    var bonusExp: Int? = nil
}

struct Turn: Codable {
    var selectedRange: [Int]? = nil
    var isAnimating: Bool = false
    var isBetted: Bool = false
    var betOnEven: Bool? = nil
    var dices: [Int] = [1]
    var point: Int = 0
}
