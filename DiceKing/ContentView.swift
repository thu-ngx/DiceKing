//
//  ContentView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var applicationVM = ApplicationViewModel()
    
    var body: some View {
            WelcomeView()
        .environmentObject(applicationVM)
        .preferredColorScheme(applicationVM.application.colorScheme)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
