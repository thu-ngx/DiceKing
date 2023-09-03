//
//  Application.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation
import SwiftUI

struct Application {
    // Game specific configurations
    var selectedRange: Int = 0
    var isEvenNumber: Bool?
    var isBetted: Bool = false

    // App specific configurations
    var dices: [Int] = [1, 1]
    var rounds: [Round] = [Round()]
    var colorScheme: ColorScheme = .dark

    init() {
        // Default values
        self.selectedRange = 0
        self.isEvenNumber = nil
        self.isBetted = false

        self.dices = [1, 1]
        self.rounds = [Round()]
        self.colorScheme = .dark
    }
}
