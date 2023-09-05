//
//  LanguageSwitcherView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import SwiftUI

struct LanguageSwitcherView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            VStack (alignment: .leading, spacing: 0) {
                Text("Language")
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30).weight(.semibold))
                Text("This will change the app's language")
                    .foregroundColor(Color("yellow").opacity(0.9))
                    .font(.system(size: 20).weight(.semibold))
            }
            
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                Button {
                    appVM.useEnglish()
                } label: {
                    Text("English")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(appVM.application.locale == "en" ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(appVM.application.locale == "en")
                }
                
                Button {
                    appVM.useVietnamese()
                } label: {
                    Text("Vietnamese")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(appVM.application.locale == "vi" ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(appVM.application.locale == "vi")
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 30)
    }
}

struct LanguageSwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSwitcherView().environmentObject(ApplicationViewModel())
    }
}
