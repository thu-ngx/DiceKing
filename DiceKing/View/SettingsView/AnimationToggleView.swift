//
//  AnimationToggleView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import SwiftUI

struct AnimationToggleView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    @EnvironmentObject var gameVM: GameViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            VStack (alignment: .leading, spacing: 0) {
                Text("Animation")
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30).weight(.semibold))
                Text("Enable or disable animation")
                    .foregroundColor(Color("yellow").opacity(0.9))
                    .font(.system(size: 20).weight(.semibold))
            }
            
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                Button {
                    gameVM.gm.enableAnimation = true
                    audioVM.playClickSound()
                } label: {
                    Text("Enable")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(gameVM.isAnimationEnabled() ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(gameVM.isAnimationEnabled())
                }
                
                Button {
                    gameVM.gm.enableAnimation = false
                    audioVM.playClickSound()
                } label: {
                    Text("Disable")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(gameVM.isAnimationEnabled() ? 0.5 : 1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(!gameVM.isAnimationEnabled())
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 20)
    }
}

struct AnimationToggleView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationToggleView()
            .environmentObject(ApplicationViewModel())
            .environmentObject(AudioViewModel())
            .environmentObject(GameViewModel())
    }
}
