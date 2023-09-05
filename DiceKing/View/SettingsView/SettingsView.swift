//
//  SettingsView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var gameVM: GameViewModel
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Settings")
                    .font(.system(size: 50).weight(.bold))
                    .foregroundColor(Color("yellow"))
                    .padding(.bottom, 30)
                
                Spacer()
                
                DebugView()
                GameModeSwitcher()
                AppThemeSwitcherView()
                
                Spacer()
                
                
                // MARK: RESET
                Button {
                    gameVM.resetAll()
                } label: {
                    Text("Reset to default")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 200, height: 50)
                        .background(Color("red").opacity(1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                }
                
                Button {
                    // switch account
                } label: {
                    Text("Switch account")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 200, height: 50)
                        .background(Color("red").opacity(1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                }
            }
            .frame(height: 600)
        }
    }
}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//            .environmentObject(ApplicationViewModel())
//            .environmentObject(GameViewModel())
//            .preferredColorScheme(.dark)
//        SettingsView()
//            .environmentObject(ApplicationViewModel())
//            .environmentObject(GameViewModel())
//            .preferredColorScheme(.light)
//    }
//}
