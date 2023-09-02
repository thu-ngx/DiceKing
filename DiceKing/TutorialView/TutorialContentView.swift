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
            Text("\u{2022} There are 2 game modes: 2 🎲 and 3 🎲, each game mode has different bet options.")
            Text("\u{2022} Each game has different numbers of turns, coins, winning and losing points based on current level.")
            Text("\u{2022} Win bet if total of 🎲 is in chosen range.")
            Text("\u{2022} Win points if not losing all coins before game end.")
            Text("\u{2022} Special rolls award achievements")
            Text("\u{2022} Enter the same name to continue playing.")
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
