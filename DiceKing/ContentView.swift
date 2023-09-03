//
//  ContentView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appModeVM = AppModeViewModel()
    
    var body: some View {
        NavigationView {
            NameInputView()
        }
        .environmentObject(appModeVM)
        .preferredColorScheme(appModeVM.appMode.colorScheme)
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
