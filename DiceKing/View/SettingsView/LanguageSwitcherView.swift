//
//  LanguageSwitcherView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import SwiftUI

struct LanguageSwitcherView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            VStack (alignment: .leading, spacing: 0) {
                Text(NSLocalizedString("language", bundle: .main, comment: ""))
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30).weight(.semibold))
                Text(NSLocalizedString("language_description", bundle: .main, comment: ""))
                    .foregroundColor(Color("yellow").opacity(0.9))
                    .font(.system(size: 20).weight(.semibold))
            }
            
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                Button {
                    appVM.useEnglish()
                    audioVM.playClickSound()

                    // Alert user that the app will restart
                    let alert = UIAlertController(title: NSLocalizedString("announcement", bundle: .main, comment: ""), message: NSLocalizedString("switching_language_message", bundle: .main, comment: ""), preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("ok", bundle: .main, comment: ""), style: .default))
                    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                } label: {
                    Text(NSLocalizedString("english", bundle: .main, comment: ""))
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
                    audioVM.playClickSound()

                    // Alert user that the app will restart
                    let alert = UIAlertController(title: NSLocalizedString("announcement", bundle: .main, comment: ""), message: NSLocalizedString("switching_language_message", bundle: .main, comment: ""), preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("ok", bundle: .main, comment: ""), style: .default))
                    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                } label: {
                    Text(NSLocalizedString("vietnamese", bundle: .main, comment: ""))
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
        .padding(.bottom, 20)
    }
}

struct LanguageSwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSwitcherView()
            .environmentObject(ApplicationViewModel())
            .environmentObject(AudioViewModel())
    }
}
