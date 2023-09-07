//
//  Turn.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import Foundation

struct Turn: Codable {
    var selectedRange: [Int]? = nil
    var isAnimating: Bool = false
    var isBetted: Bool = false
    var betOnEven: Bool? = nil
    var dices: [Int] = [1]
    var point: Int = 0
}
