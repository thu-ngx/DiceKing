//
//  ContentView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appVM = ApplicationViewModel()
    @StateObject var gameVM = GameViewModel()
    
    var body: some View {
            WelcomeView()
        .environmentObject(appVM)
        .environmentObject(gameVM)
        .preferredColorScheme(appVM.getColorScheme())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
