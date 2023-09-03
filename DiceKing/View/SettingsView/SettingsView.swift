//
//  SettingsView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var applicationVM: ApplicationViewModel
    
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
                // MARK: GAME MODE
                VStack (alignment: .leading, spacing: 0) {
                    Text("Game mode")
                        .foregroundColor(Color("yellow"))
                        .font(.system(size: 30).weight(.semibold))
                    Text("This will change your bet options")
                        .foregroundColor(Color("yellow").opacity(0.9))
                        .font(.system(size: 20).weight(.semibold))
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach([1, 2, 3, 4, 5, 6], id: \.self) { diceCount in
                            Button {
                                applicationVM.setDices(dices: diceCount)
                            } label: {
                                Text("\(diceCount) dices")
                                    .font(.system(size: 20).weight(.heavy))
                                    .foregroundColor(Color("yellow"))
                                    .frame(width: 120, height: 40)
                                    .background(Color("red").opacity(applicationVM.getDices().count == diceCount ? 1 : 0.5))
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                                    .disabled(applicationVM.getDices().count == diceCount)
                            }
                        }
                    }
                }
                
                // MARK: DARK MODE
                VStack (alignment: .leading, spacing: 0) {
                    Text("Dark mode")
                        .foregroundColor(Color("yellow"))
                        .font(.system(size: 30).weight(.semibold))
                    Text("This will change the app's theme")
                        .foregroundColor(Color("yellow").opacity(0.9))
                        .font(.system(size: 20).weight(.semibold))
                }
                
                HStack (spacing: 30) {
                    Button {
                        applicationVM.setLightMode()
                    } label: {
                        Text("Light")
                            .font(.system(size: 20).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .frame(width: 120, height: 40)
                            .background(Color("red").opacity(applicationVM.application.colorScheme == .light ? 1 : 0.5))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                    }
                    
                    Button {
                        applicationVM.setDarkMode()
                    } label: {
                        Text("Dark")
                            .font(.system(size: 20).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .frame(width: 120, height: 40)
                            .background(Color("red").opacity(applicationVM.application.colorScheme == .dark ? 1 : 0.5))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                    }
                    
                }
                
                Spacer()
                
                
                // MARK: RESET
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
