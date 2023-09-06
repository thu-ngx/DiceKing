//
//  ContentView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appVM = ApplicationViewModel()
    @StateObject var audioVM = AudioViewModel()
    @StateObject var dbVM = DatabaseViewModel()
    @StateObject var gameVM = GameViewModel()
    
    var body: some View {
        WelcomeView()
            .environmentObject(dbVM)
            .environmentObject(appVM)
            .environmentObject(gameVM)
            .environmentObject(audioVM)
            .preferredColorScheme(appVM.getColorScheme())
            .onAppear {
                audioVM.playBGM()
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
