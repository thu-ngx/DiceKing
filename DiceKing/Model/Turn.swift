//
//  Turn.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import Foundation

class Turn {
    var dices: [Int] = [1]
    var selectedRange: [Int]? = nil
    var betOnEven: Bool? = nil
    var point: Int = 0

    func getDiceSum() -> Int {
        return dices.reduce(0, +)
    }

    func getDiceNames() -> [String] {
        var names: [String] = []
        
        for dice in dices {
            names.append("Dice \(dice)")
        }

        return names
    }

    func getSelectedRangeIndex() -> Int? {
        guard let selectedRange = selectedRange else {
            return nil
        }

        let ranges = getRanges()

        for i in 0..<ranges.count {
            if ranges[i] == selectedRange {
                return i
            }
        }

        return nil
    }

    func getIsEvenNumber() -> Bool {
        return getDiceSum() % 2 == 0
    }

    // MARK: OTHER

    func randomizeDices() {
        // loop through current dices and randomize them
        for i in 0..<dices.count {
            dices[i] = Int.random(in: 1...6)
        }
    }

    func isBetted() -> Bool {
        return selectedRange != nil
    }

    func isFinished() -> Bool {
        return point != 0
    }

    func getRanges() -> [[Int]] {
        let numberOfRanges = 3
        
        let dices = dices.count
        
        var ranges: [[Int]] = []
        
        // Initialize ranges
        for _ in 0..<numberOfRanges {
            ranges.append([])
        }
        
        let min = dices
        let max = dices * 6
        let diff = max - min
        
        let range = diff / 3
        
        // first range
        ranges[0].append(min)
        ranges[0].append(min + range)
        
        // second range
        ranges[1].append(min + range + 1)
        ranges[1].append(max - range - 1)
        
        // third range
        ranges[2].append(max - range)
        ranges[2].append(max)
        
        return ranges
    }
}
