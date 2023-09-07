//
//  Constants.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 06/09/2023.
//

import Foundation


struct Constants {
    // Special
    static let devMode = true

    // Level
    static let expPerLevel = 100
    static let levelMultiplier = 2

    // Turn
    static let forceSingleTurn = devMode ? true : false
    static let maxTurns = 15
    static let maxCoins = 500

    // Dice
    static let defaultDices = 2
    static let minDice = 1
    static let maxDice = 6

    // Game
    static let defaultAutoBet = devMode ? true : false
    static let expPerWin = 30
    static let expPerLose = 10
    static let rangeBetPercentage = 0.25      // 25%
    static let oddOrEvenBetPercentage = 0.05  // 5%

    // Animation
    static let defaultEnableAnimation = devMode ? false : true
    static let animationTurns = 10
    static let animationDuration = 0.1
    static let delayAfterAnimation = 0.5
}
