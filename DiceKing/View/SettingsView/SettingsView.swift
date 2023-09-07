//
//  SettingsView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                Text(NSLocalizedString("settings", bundle: .main, comment: ""))
                    .font(.system(size: 50).weight(.bold))
                    .foregroundColor(Color("yellow"))
                    .padding(.bottom, 30)
                
                Spacer()
                
                GameModeSwitcher()
                AppThemeSwitcherView()
                LanguageSwitcherView()
                AnimationToggleView()
                AudioToggleView()
                RandomizeBetToggleView()
                
                Spacer()
                OtherSettingsView()
            }
            .padding(.horizontal, 30)
            .blur(radius: appVM.getShowAccountSwitcher() ? 5 : 0)
        }.overlay {
            NameInputView()
            .opacity(appVM.getShowAccountSwitcher() ? 1 : 0)
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
