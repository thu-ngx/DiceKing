//
//  PointDetailsSheetView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct PointDetailsSheetView: View {
    @EnvironmentObject var audioVM: AudioViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading) {
                HStack {
                    Spacer()
                    
                    // MARK: CLOSE BUTTON
                    Button {
                        withAnimation {
                            // MARK: CLOSE SHEET
                            isPresented = false
                        }
                        audioVM.playClickSound()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .frame(width: 20)
                    }
                }
                // MARK: TITLE
                Text(NSLocalizedString("levels_and_exp", bundle: .main, comment: ""))
                    .font(.system(size: 30).weight(.medium))
                    .padding(.bottom, 30)
                    .frame(width: 350)
                
                // MARK: CONTENT
                ScrollView {
                    VStack (spacing: 20) {
                        ExperiencePointsList()
                        CoinsList()
                        TurnsPerGameList()
                        ExpPerGameList()
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
            Text(NSLocalizedString("level_requirement", bundle: .main, comment: ""))
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text(NSLocalizedString("level_requirement_description", bundle: .main, comment: ""))
                .font(.system(size: 18).weight(.medium))
        }
    }
}


// MARK: COINS
struct CoinsList: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text(NSLocalizedString("starting_coins_per_game", bundle: .main, comment: ""))
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text(NSLocalizedString("starting_coins_per_game_description", bundle: .main, comment: ""))
                .font(.system(size: 18).weight(.medium))
        }
    }
}

// MARK: TURNS PER GAME
struct TurnsPerGameList: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text(NSLocalizedString("turns_per_game", bundle: .main, comment: ""))
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text(NSLocalizedString("turns_per_game_description", bundle: .main, comment: ""))
                .font(.system(size: 18).weight(.medium))
        }
    }
}

// MARK: WIN EXP
struct ExpPerGameList: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text(NSLocalizedString("exp_per_game", bundle: .main, comment: ""))
                .font(.system(size: 25).weight(.bold))
                .frame(width: 350, alignment: .leading)
            Text("\(NSLocalizedString("exp_per_game_won", bundle: .main, comment: ""))\n\(NSLocalizedString("exp_per_game_lost", bundle: .main, comment: ""))")
                .font(.system(size: 18).weight(.medium))
        }
    }
}
