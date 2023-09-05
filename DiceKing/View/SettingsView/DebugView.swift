//
//  DebugView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 05/09/2023.
//

import SwiftUI

struct DebugView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var gameVM: GameViewModel

    var body: some View {
        Text("Debug")
            .font(.system(size: 50).weight(.bold))
            .foregroundColor(Color("yellow"))
            .padding(.bottom, 30)

        Spacer()

        // Display all view model data
        Text("Color Scheme: \(appVM.getColorSchemeLabel())")
        Text("Dices: \(gameVM.getDicesLabel())")
        Text("Current turn point: \(gameVM.getPointLabel())")
        Text("Current turn bet: \(gameVM.getOddOrEvenLabel())")
        Text("Current turn range: \(gameVM.getRangeLabel())")
        Text("Current turn is betted: \(gameVM.getIsBettedLabel())")
        Text("Current turn number: \(gameVM.getTurnsLabel())")
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
            .environmentObject(ApplicationViewModel())
            .environmentObject(GameViewModel())
    }
}
