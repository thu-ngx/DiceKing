//
//  GameManager.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import Foundation

struct GameManager {
    var defaultDices: Int = UserDefaults.standard.string(forKey: "defaultDices") == nil ? Constants.defaultDices : Int(UserDefaults.standard.string(forKey: "defaultDices")!)!
    var enableAnimation: Bool = UserDefaults.standard.string(forKey: "enableAnimation") == nil ? Constants.defaultEnableAnimation : UserDefaults.standard.string(forKey: "enableAnimation") == "true" ? true : false
    var autoBet: Bool = UserDefaults.standard.string(forKey: "autoBet") == nil ? Constants.defaultAutoBet : UserDefaults.standard.string(forKey: "autoBet") == "true" ? true : false
    var currentRound: Round = Round()
}
