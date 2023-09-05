//
//  WelcomeView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var appVM: ApplicationViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Color("blue")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    // MARK: APP INFO
                    VStack {
                        Text("DiceKing")
                            .font(.system(size: 60).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                        Text("Claim Your Fortune")
                            .font(.system(size: 30).weight(.semibold))
                            .foregroundColor(Color("yellow"))
                    }
                    
                    // MARK: LOGO
                    Image("Dice_King_Transparent")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 220)
                    
                    // MARK: PLAYER STATUS
                    // appVM.hasUser() ? PlayerStatusView() : nil
                    PlayerStatusView()
                    
                    // MARK: NAV LINKS
                    NavigationLinksView()
                    
                    Spacer()
                }
                .blur(radius: appVM.hasUser() ? 0 : 5)
            }
            .overlay {
                NameInputView()
                    .opacity(appVM.hasUser() ? 0 : 1)
            }
        }
        .navigationBarHidden(true)
    }
}
