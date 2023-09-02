//
//  PlayerViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation

class PlayerViewModel: ObservableObject {
    @Published var player = Player(name: "", currentExp: 0)
    
    // get current level by compare the currentExp of player with the minExp of each level
    func getCurrentLevel() -> Level {
        var currentLevel = levels[0]
        
        for level in levels {
            if player.currentExp >= level.minExp {
                currentLevel = level
                break;
            }
        }
        return currentLevel
    }
}
