//
//  GameStatusView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct GameStatusView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // Implement for each loop using indices
                ForEach(appVM.getLastRound()!.points.indices) { index in
                    GameStatusCircle(point: appVM.getLastRound()!.points[index])
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(width: 240)
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
    }
}
