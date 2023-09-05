//
//  TutorialContentView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct TutorialContentView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("\u{2022} There are 6 dice(🎲) options, ranging from 1 🎲 to 6 🎲s, each with different bet options.")
            Text("\u{2022} Each game has different numbers of turns, coins, winning and losing points based on current level.")
            Text("\u{2022} Win bet if total of 🎲 sum is in chosen range.")
            Text("\u{2022} Win experience points if your coin count is greater than or equal to 0 at the end of the game round.")
            Text("\u{2022} In case special patterns are met, you'll earn new achievements accordingly.")
            Text("\u{2022} Use the same username to keep track of your progress.")
        }
        .font(.system(size: 20).weight(.medium))
        .foregroundColor(Color("yellow"))
    }
}

struct TutorialContentView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialContentView()
    }
}
