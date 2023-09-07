//
//  AudioToggleView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 04/09/2023.
//

import SwiftUI

struct AudioToggleView: View {
    @EnvironmentObject var audioVM: AudioViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            VStack (alignment: .leading, spacing: 0) {
                Text(NSLocalizedString("audio", bundle: .main, comment: ""))
                    .foregroundColor(Color("yellow"))
                    .font(.system(size: 30).weight(.semibold))
                Text(NSLocalizedString("audio_description", bundle: .main, comment: ""))
                    .foregroundColor(Color("yellow").opacity(0.9))
                    .font(.system(size: 20).weight(.semibold))
            }
            
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
                Button {
                    audioVM.enableAudio()
                    audioVM.playClickSound()
                } label: {
                    Text(NSLocalizedString("enable", bundle: .main, comment: ""))
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(audioVM.isAudioEnabled ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(audioVM.isAudioEnabled)
                }
                
                Button {
                    audioVM.disableAudio()
                    audioVM.playClickSound()
                } label: {
                    Text(NSLocalizedString("disable", bundle: .main, comment: ""))
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .background(Color("red").opacity(audioVM.isAudioEnabled ? 0.5 : 1))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(!audioVM.isAudioEnabled)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 20)
    }
}

struct AudioToggleView_Previews: PreviewProvider {
    static var previews: some View {
        AudioToggleView().environmentObject(AudioViewModel())
    }
}
