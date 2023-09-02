//
//  RoundViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation

class RoundViewModel: ObservableObject {
    @Published var round = Round()

    // each round has currentLevel and the level has turns per round
    // loop through all turns and get the result of the round
    // if 
    // get the result of the round
    func getResult() -> String {
        
    }

    // set current level of the player 
    func setCurrentLevel() {
        round.currentLevel = PlayerViewModel().getCurrentLevel()
    }


}
