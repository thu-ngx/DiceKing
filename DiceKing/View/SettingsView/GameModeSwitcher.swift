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
        VStack (alignment: .leading, spacing: 16) {
            VStack (alignment: .leading, spacing: 0) {
                Text("Game mode")
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30).weight(.semibold))
                Text("This will change your bet options")
                    .foregroundColor(Color("yellow").opacity(0.9))
                    .font(.system(size: 20).weight(.semibold))
            }
            
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                ForEach(1...6, id: \.self) { diceCount in
                    Button {
                        gameVM.setDefaultDices(dices: diceCount)
                    } label: {
                        Text("\(diceCount) dices")
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .font(.system(size: 20).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .background(Color("red").opacity(gameVM.gm.defaultDices == diceCount ? 1 : 0.5))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                            .disabled(gameVM.getDefaultDices() == diceCount)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct GameModeSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        GameModeSwitcher().environmentObject(GameViewModel())
    }
}
