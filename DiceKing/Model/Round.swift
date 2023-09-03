//
//  Round.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 03/09/2023.
//

import Foundation

struct Round {
    var points: [Int]
    var expDiff: Int?
    var isWon: Bool?

    init() {
        self.points = []
    }
}
