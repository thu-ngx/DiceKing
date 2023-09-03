//
//  Round.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 03/09/2023.
//

import Foundation

struct Round {
    var startingPoint: Int
    var points: [Int]
    var expDiff: Int?

    init() {
        self.startingPoint = 50
        self.points = [0, 0, 0]
        self.expDiff = nil
    }
}
