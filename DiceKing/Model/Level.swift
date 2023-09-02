//
//  Level.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation

public struct Level {
    var levelNumber: Int
    var minExp: Int
    var startingCoinsPerGame: Int
    var turnsPerGame: Int
    var winningExp: Int
    var losingExp: Int
}

let levels: [Level] = [
    Level(levelNumber: 1, minExp: 0, startingCoinsPerGame: 50, turnsPerGame: 5, winningExp: 20, losingExp: 5),
    Level(levelNumber: 2, minExp: 100, startingCoinsPerGame: 75, turnsPerGame: 7, winningExp: 40, losingExp: 10),
    Level(levelNumber: 3, minExp: 300, startingCoinsPerGame: 100, turnsPerGame: 10, winningExp: 60, losingExp: 15),
    Level(levelNumber: 4, minExp: 600, startingCoinsPerGame: 150, turnsPerGame: 12, winningExp: 80, losingExp: 20),
    Level(levelNumber: 5, minExp: 1000, startingCoinsPerGame: 200, turnsPerGame: 15, winningExp: 100, losingExp: 25)
]
