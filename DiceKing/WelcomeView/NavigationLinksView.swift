//
//  NavigationLinksView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct NavigationLinksView: View {
    // Define a struct to hold label and destination information
    struct Destination {
        var label: String
        var destination: AnyView
    }
    
    // Create an array of Destination objects
    let destinations: [Destination] = [
        Destination(label: "Start", destination: AnyView(GameView())),
        Destination(label: "Tutorial", destination: AnyView(TutorialView())),
        Destination(label: "Leaderboard", destination: AnyView(LeaderboardView())),
        Destination(label: "Settings", destination: AnyView(SettingsView()))
    ]
    
    var body: some View {
        VStack(spacing: 15) {
            // Loop through the array to create NavigationLinks
            ForEach(destinations, id: \.label) { destination in
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
            }
        }
    }
}

struct NavigationLinksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinksView()
    }
}
