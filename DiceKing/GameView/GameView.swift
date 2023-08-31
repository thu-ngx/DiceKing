//
//  GameView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            Color("blue")
                    .edgesIgnoringSafeArea(.all)
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
