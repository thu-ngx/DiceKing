//
//  AppThemeSwitcherView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import SwiftUI

struct AppThemeSwitcherView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            VStack (alignment: .leading, spacing: 0) {
                Text("Dark mode")
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30).weight(.semibold))
                Text("This will change the app's theme")
                    .foregroundColor(Color("yellow").opacity(0.9))
                    .font(.system(size: 20).weight(.semibold))
            }
            
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                Button {
                    appVM.setLightMode()
                } label: {
                    Text("Light")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(appVM.application.colorScheme == .light ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(appVM.application.colorScheme == .light)
                }
                
                Button {
                    appVM.setDarkMode()
                } label: {
                    Text("Dark")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(appVM.application.colorScheme == .dark ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(appVM.application.colorScheme == .dark)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 30)
    }
}

struct AppThemeSwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        AppThemeSwitcherView().environmentObject(ApplicationViewModel())
    }
}
