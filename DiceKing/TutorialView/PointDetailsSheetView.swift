//
//  PointDetailsSheetView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct PointDetailsSheetView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading) {
                HStack {
                    Spacer()
                    
                    // MARK: CLOSE BUTTON
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .frame(width: 20)
                    }
                }
                // MARK: TITLE
                Text("Points details")
                    .font(.system(size: 30).weight(.medium))
                    .padding(.bottom, 30)
                    .frame(width: 350)
                
                // MARK: CONTENT
                ScrollView {
                    VStack (spacing: 20) {
                        ExperiencePointsList()
                        CoinsList()
                        TurnsPerGameList()
                        WinningExpList()
                        LosingExpList()
                    }
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .foregroundColor(Color("yellow"))
            .padding()
        }
    }
}


// MARK: EXP POINTS
struct ExperiencePointsList: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Experience points to unlock level")
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text("Level 1: 0\nLevel 2: 100\nLevel 3: 300\nLevel 4: 600\nLevel 5: 1000")
                .font(.system(size: 18).weight(.medium))
        }
    }
}


// MARK: COINS
struct CoinsList: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Starting coins per game")
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text("Level 1: 50\nLevel 2: 75\nLevel 3: 100\nLevel 4: 150\nLevel 5: 200")
                .font(.system(size: 18).weight(.medium))
        }
    }
}

// MARK: TURNS PER GAME
struct TurnsPerGameList: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Turns per game")
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text("Level 1: 5 turns\nLevel 2: 7 turns\nLevel 3: 10 turns\nLevel 4: 12 turns\nLevel 5: 15 turns")
                .font(.system(size: 18).weight(.medium))
        }
    }
}

// MARK: WIN EXP
struct WinningExpList: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Winning exp per game")
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text("Level 1: +20 exp\nLevel 2: +40 exp\nLevel 3: +60 exp\nLevel 4: +80 exp\nLevel 5: +100 exp")
                .font(.system(size: 18).weight(.medium))
        }
    }
}

// MARK: LOSE EXP
struct LosingExpList: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Losing exp per game")
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text("Level 1: -5 exp\nLevel 2: -10 exp\nLevel 3: -15 exp\nLevel 4: -20 exp\nLevel 5: -25 exp")
                .font(.system(size: 18).weight(.medium))
        }
    }
}


struct PointDetailsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        PointDetailsSheetView()
    }
}
