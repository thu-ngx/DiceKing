//
//  Constants.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 06/09/2023.
//

import Foundation


struct Constants {
    // Special
    static let devMode = false

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


    static let defaultUsers: [User] = [
        User(name: "Thu", exp: 0, badges: ["NEWBIE"], rounds: []),
        User(name: "Huy", exp: 80, badges: ["NEWBIE"], rounds: []),
        User(name: "Hieu", exp: 280, badges: ["NEWBIE"], rounds: []),
        User(name: "Hoa", exp: 160, badges: ["NEWBIE"], rounds: []),
        User(name: "Hai", exp: 240, badges: ["NEWBIE"], rounds: []),
        User(name: "Hien", exp: 200, badges: ["NEWBIE"], rounds: []),
        User(name: "Phuc", exp: 1200, badges: ["NEWBIE", "GRANDMASTER"], rounds: []),
        User(name: "Lam", exp: 400, badges: ["NEWBIE"], rounds: []),
        User(name: "Kha", exp: 480, badges: ["NEWBIE"], rounds: []),
        User(name: "Anh", exp: 360, badges: ["NEWBIE"], rounds: []),
        User(name: "Son", exp: 600, badges: ["NEWBIE"], rounds: []),
        User(name: "Tuan", exp: 520, badges: ["NEWBIE"], rounds: []),
        User(name: "Xuan", exp: 1360, badges: ["NEWBIE", "GRANDMASTER"], rounds: []),
        User(name: "Loc", exp: 960, badges: ["NEWBIE", "GRANDMASTER"], rounds: []),
        User(name: "Han", exp: 1520, badges: ["NEWBIE", "GRANDMASTER"], rounds: []),
        User(name: "Hung", exp: 720, badges: ["NEWBIE"], rounds: []),
        User(name: "Vy", exp: 760, badges: ["NEWBIE"], rounds: []),
        User(name: "Vinh", exp: 40, badges: ["NEWBIE"], rounds: []),
        User(name: "Ngoc", exp: 0, badges: ["NEWBIE"], rounds: []),
        User(name: "Huong", exp: 80, badges: ["NEWBIE"], rounds: []),
        User(name: "Huyen", exp: 40, badges: ["NEWBIE"], rounds: []),
        User(name: "Khang", exp: 0, badges: ["NEWBIE"], rounds: []),
        User(name: "Khanh", exp: 40, badges: ["NEWBIE"], rounds: []),
        User(name: "Thang", exp: 4080, badges: ["NEWBIE", "GRANDMASTER"], rounds: []),
        User(name: "Minh", exp: 2760, badges: ["NEWBIE", "GRANDMASTER"], rounds: []),
]
}
