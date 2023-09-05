//
//  GameModeSwitcher.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import SwiftUI

struct GameModeSwitcher: View {
    @EnvironmentObject var gameVM: GameViewModel
    
    var body: some View {
        // MARK: GAME MODE
        VStack (alignment: .leading, spacing: 0) {
            Text("Game mode")
                .foregroundColor(Color("yellow"))
                .font(.system(size: 30).weight(.semibold))
            Text("This will change your bet options")
                .foregroundColor(Color("yellow").opacity(0.9))
                .font(.system(size: 20).weight(.semibold))
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach([1, 2, 3, 4, 5, 6], id: \.self) { diceCount in
                    Button {
                        gameVM.setDefaultDices(dices: diceCount)
                    } label: {
                        Text("\(diceCount) dices")
                            .font(.system(size: 20).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .frame(width: 120, height: 40)
                            .background(Color("red").opacity(gameVM.gm.defaultDices == diceCount ? 1 : 0.5))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                            .disabled(gameVM.getDefaultDices() == diceCount)
                    }
                }
            }
        }
    }
}

struct GameModeSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        GameModeSwitcher().environmentObject(GameViewModel())
    }
}
