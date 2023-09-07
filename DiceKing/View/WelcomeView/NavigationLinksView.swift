//
//  NavigationLinksView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct NavigationLinksView: View {
    @EnvironmentObject var gameVM: GameViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    
    // Define a struct to hold label and destination information
    struct Destination {
        var label: String
        var destination: AnyView
    }
    
    var body: some View {
        let destinations = [
            Destination(label: NSLocalizedString(gameVM.getStartLabel(), bundle: .main, comment: ""), destination: AnyView(GameView())),
            Destination(label: NSLocalizedString("tutorial", bundle: .main, comment: ""), destination: AnyView(TutorialView())),
            Destination(label: NSLocalizedString("leaderboard", bundle: .main, comment: ""), destination: AnyView(LeaderboardView())),
            Destination(label: NSLocalizedString("settings", bundle: .main, comment: ""), destination: AnyView(SettingsView()))
        ]
        
        VStack(spacing: 15) {
            ForEach(destinations.indices, id: \.self) { index in
            let destination = destinations[index]
                
            NavigationLink(destination: destination.destination) {
                Text(destination.label)
                    .font(.system(size: 33).weight(.heavy))
                    .foregroundColor(Color("yellow"))
                    .frame(width: 300)
                    .padding(.vertical, 15)
                    .background(Color("red"))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(1), radius: 5, x: 0, y: 5)
            }
            .simultaneousGesture(TapGesture().onEnded {
                audioVM.playClickSound()
            })
        }
        }
    }
}

struct NavigationLinksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinksView()
            .environmentObject(GameViewModel())
            .environmentObject(AudioViewModel())
    }
}
