//
//  RandomizeBetToggleView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import SwiftUI

struct RandomizeBetToggleView: View {
    @EnvironmentObject var gameVM: GameViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            VStack (alignment: .leading, spacing: 0) {
                Text("Betting")
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30).weight(.semibold))
                Text("Choose how to bet")
                    .foregroundColor(Color("yellow").opacity(0.9))
                    .font(.system(size: 20).weight(.semibold))
            }
            
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                Button {
                    gameVM.useManualBet()
                    audioVM.playClickSound()
                } label: {
                    Text("Manual")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(gameVM.isAutoBet() ? 0.5 : 1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(!gameVM.isAutoBet())
                }
                
                Button {
                    gameVM.useAutoBet()
                    audioVM.playClickSound()
                } label: {
                    Text("Automatic")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(gameVM.isAutoBet() ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(gameVM.isAutoBet())
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 20)
    }
}

struct RandomizeBetToggleView_Previews: PreviewProvider {
    static var previews: some View {
        RandomizeBetToggleView().environmentObject(ApplicationViewModel())
    }
}
