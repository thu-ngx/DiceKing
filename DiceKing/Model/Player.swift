//
//  Player.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var currentExp: Int
    var pastRounds: [Round] = []
}


