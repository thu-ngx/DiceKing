//
//  GameManager.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import Foundation

struct GameManager {
    var defaultDices: Int = 1
    var currentRound: Round = Round()
    var pastRounds: [Round] = []
}
