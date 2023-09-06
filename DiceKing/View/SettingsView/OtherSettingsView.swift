//
//  OtherSettingsView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 05/09/2023.
//

import SwiftUI

struct OtherSettingsView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel
    @EnvironmentObject var gameVM: GameViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            VStack (alignment: .leading, spacing: 0) {
                Text("Other settings")
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30).weight(.semibold))
            }
            
            LazyVGrid(columns: [GridItem()], spacing: 8) {
                Button {
                    appVM.resetAll()
                    gameVM.resetAll()
                } label: {
                    Text("Reset to default")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color("red").opacity(appVM.isDefault() && gameVM.isDefault() ? 0.5 : 1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                }
                .disabled(appVM.isDefault() && gameVM.isDefault())
                
                appVM.hasUser() ? Button {
                    appVM.application.showAccountSwitcher = true
                } label: {
                    Text("Switch profile")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color("red").opacity(1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                } : nil

                appVM.hasUser() ? Button {
                    appVM.deleteUser(db: dbVM)
                } label: {
                    Text("Delete profile")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color("red").opacity(1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                } : nil
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 20)
    }
}

struct OtherSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        OtherSettingsView()
            .environmentObject(ApplicationViewModel())
            .environmentObject(DatabaseViewModel())
            .environmentObject(GameViewModel())
    }
}
