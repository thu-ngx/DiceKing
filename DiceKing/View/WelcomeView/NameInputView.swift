//
//  NameInputView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 30/08/2023.
//

import SwiftUI

struct NameInputView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel
    @EnvironmentObject var gameVM: GameViewModel
    
    var body: some View {
        ZStack {
            Color("blue").opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            ZStack  {
                Color("yellow")
                VStack(spacing: 30) {
                    // MARK: INPUT FIELD
                    VStack {
                        Text(NSLocalizedString("enter_name", bundle: .main, comment: ""))
                            .font(.system(size: 25).weight(.medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField(NSLocalizedString("your_name", bundle: .main, comment: ""), text: $appVM.application.currentUserName)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 8)
                            .background(Color("transparent-white").cornerRadius(10))
                            .frame(height: 6)
                            .font(.system(size: 20))
                    }
                    .foregroundColor(Color("blue"))
                    // MARK: SAVE BUTTON
                    Button(action: {
                        audioVM.playClickSound()
                        appVM.loadUser(db: dbVM, game: gameVM)
                    }) {
                        Text(NSLocalizedString("continue", bundle: .main, comment: ""))
                            .font(.system(size: 18).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .padding(.horizontal, 25)
                            .padding(.vertical, 10)
                            .background(Color("red"))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                    }
                    .opacity(appVM.application.currentUserName.isEmpty ? 0.5 : 1)
                    .disabled(appVM.application.currentUserName.isEmpty)
                }
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: 160)
            .cornerRadius(20)
            .padding(.horizontal, 30)
        }
    }
    
}

struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NameInputView()
            .environmentObject(ApplicationViewModel())
            .environmentObject(DatabaseViewModel())
            .environmentObject(AudioViewModel())
            .environmentObject(GameViewModel())
    }
}

