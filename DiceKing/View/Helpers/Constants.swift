//
//  Constants.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 06/09/2023.
//

import Foundation

struct Constants {
    // Level
    static let expPerLevel = 100
    static let levelMultiplier = 2

    // Turn
    static let forceSingleTurn = false
    static let maxTurns = 15
    static let maxCoins = 500

    // Dice
    static let defaultDices = 1
    static let minDice = 1
    static let maxDice = 6

    // Game
    static let expPerWin = 40
    static let expPerLose = 5
    static let rangeBetPercentage = 0.3     // 30%
    static let oddOrEvenBetPercentage = 0.2 // 20%

    // Animation
    static let defaultEnableAnimation = true
    static let animationTurns = 10
    static let animationDuration = 0.1
    static let delayAfterAnimation = 0.5
}