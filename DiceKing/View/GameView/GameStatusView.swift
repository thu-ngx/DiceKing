//
//  GameStatusView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct GameStatusView: View {
    @EnvironmentObject var gameVM: GameViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // Instead of looping through all turns, always display via gameVM.currentRound.totalTurns, then show each turn's point if it exists
                ForEach(0..<gameVM.gm.currentRound.totalTurns) { turnIndex in
                    GameStatusCircle(point: gameVM.gm.currentRound.turns.count > turnIndex ? gameVM.gm.currentRound.turns[turnIndex].point : 0)
                }
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity)
    }
}

struct GameStatusCircle: View {
    var point: Int
    
    var body: some View {
        ZStack { // Stack views on top of each other
            Circle()
                .foregroundColor(
                    point == 0 ? Color(.gray).opacity(0.5) : point > 0 ? Color("yellow") : Color("red")
                )
                .frame(width: 50, height: 50)
            
            Text(point == 0 ? "-" : point < 0 ? "\(point)" : "+\(point)")
                .foregroundColor(point >= 0 ? .black : Color("yellow"))
                .font(.system(size: 20))
                .fontWeight(.heavy)
        }
    }
}

struct GameStatusView_Previews: PreviewProvider {
    static var previews: some View {
        GameStatusView()
            .environmentObject(GameViewModel())
    }
}
