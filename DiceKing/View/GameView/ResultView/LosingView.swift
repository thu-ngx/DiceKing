//
//  LosingView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct LosingView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel
    @EnvironmentObject var gameVM: GameViewModel

    @Binding var isShowingLosingView: Bool
    
    var body: some View {
        Button {
            audioVM.playClickSound()
            gameVM.handleRoundLose(db: dbVM, app: appVM)
            appVM.saveUser(db: dbVM)
            isShowingLosingView = false
        } label: {
            ZStack {
                Color("transparent-brown")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(NSLocalizedString("defeat", bundle: .main, comment: ""))
                        .font(.system(size: 145).weight(.bold))
                        .foregroundColor(Color("bright-red"))
                        .rotationEffect(.degrees(-35))
                        .shadow(color: Color("red").opacity(0.3), radius: 10, x: 0, y: 2)
                        .offset(y:-100)
                    Text("+\(gameVM.getLoseExpLabel()) \(NSLocalizedString("xp", bundle: .main, comment: ""))")
                        .font(.system(size: 50).weight(.semibold))
                        .foregroundColor(Color("light-red"))
                        .offset(y:-50)
                    Text(NSLocalizedString("tap_to_continue", bundle: .main, comment: ""))
                        .font(.system(size: 30).weight(.medium))
                        .foregroundColor(Color("light-red"))
                        .offset(y:50)
                }
            }
        }
    }
}

struct LosingView_Previews: PreviewProvider {
    static var previews: some View {
        LosingView(isShowingLosingView: .constant(true))
            .environmentObject(ApplicationViewModel())
            .environmentObject(DatabaseViewModel())
            .environmentObject(AudioViewModel())
            .environmentObject(GameViewModel())
    }
}