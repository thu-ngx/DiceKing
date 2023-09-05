//
//  SettingsView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                Text("Settings")
                    .font(.system(size: 50).weight(.bold))
                    .foregroundColor(Color("yellow"))
                    .padding(.bottom, 30)
                
                Spacer()
                
                // DebugView()
                GameModeSwitcher()
                AppThemeSwitcherView()
                
                Spacer()
                OtherSettingsView()
            }
            .padding(.horizontal, 30)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ApplicationViewModel())
            .environmentObject(GameViewModel())
    }
}
