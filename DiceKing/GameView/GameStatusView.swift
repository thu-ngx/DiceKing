//
//  GameStatusView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct GameStatusView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<15) { _ in
                    GameStatusCircle()
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(width: 240)
    }
}

struct GameStatusCircle: View {
    var body: some View {
        ZStack { // Stack views on top of each other
            Circle()
                .foregroundColor(Color(.gray).opacity(0.5))
                .frame(width: 40, height: 40)
            
            Text("+15")
                .foregroundColor(.black)
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
    }
}

struct GameStatusView_Previews: PreviewProvider {
    static var previews: some View {
        GameStatusView()
    }
}
