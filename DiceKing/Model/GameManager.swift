//
//  GameManager.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import Foundation

struct GameManager {
    var defaultDices: Int = Constants.defaultDices
    var enableAnimation: Bool = Constants.defaultEnableAnimation
    var autoBet: Bool = Constants.defaultAutoBet
    var currentRound: Round = Round()
}
