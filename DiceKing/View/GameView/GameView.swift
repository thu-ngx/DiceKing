//
//  GameView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct GameView: View {
    
    @State var isShowingBetOption = false
    @State var isShowingLosingView = false
    @State var isShowingWinningView = false
    
    // MARK: check bg blur
    func isBackGroundBlur() -> Bool {
        return isShowingBetOption || isShowingLosingView || isShowingWinningView
    }
    
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                // MARK: PLAYER STATUS
                PlayerStatusView()
                Spacer()
                
                
                // MARK: DICES
//                TwoDicesView()
                                ThreeDicesView()
                
                Spacer()
                
                VStack (spacing: 5)  {
                    // MARK: BET AMOUNT
                    HStack (spacing: 0) {
                        Text("Bet")
                            .foregroundColor(Color("yellow")) .font(.system(size: 26, weight: .semibold))
                        Image("coins")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                        Text("10")
                            .foregroundColor(Color("yellow")) .font(.system(size: 26, weight: .semibold))
                    }
                    
                    // MARK: BET / ROLL
                    Button {
                        // bet logic
                        isShowingWinningView = true
                    } label: {
                        Text("Roll")
                            .font(.system(size: 40).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .padding(.horizontal, 50)
                            .padding(.vertical, 10)
                            .background(Color("red"))
                            .cornerRadius(10)
                    }
                    // MARK: CURRENT COINS
                    HStack (spacing: 0) {
                        Image("coins")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                        Text("30")
                            .foregroundColor(Color("yellow")) .font(.system(size: 30, weight: .bold))
                    }
                    
                    // MARK: GAME STATUS
                    GameStatusView()
                }
                
            }
            .padding(.vertical)
            .blur(radius: isBackGroundBlur() ? 10 : 0)
        }
        .overlay {
            BetOptionView(isShowingBetOption: $isShowingBetOption)
                .opacity(isShowingBetOption  ? 1 :  0)
            LosingView(isShowingLosingView: $isShowingLosingView)
                .opacity(isShowingLosingView  ? 1 :  0)
            WinningView(isShowingWinningView: $isShowingWinningView)
                .opacity(isShowingWinningView  ? 1 :  0)
        }
    }
}



// MARK: DICES VIEW
struct TwoDicesView: View {
    var body: some View {
        HStack(spacing: 35) {
            Image("Dice 3")
                .resizable()
                .scaledToFit()
                .frame(height: 130)
            Image("Dice 1")
                .resizable()
                .scaledToFit()
                .frame(height: 130)
        }
    }
}

struct ThreeDicesView: View {
    var body: some View {
        VStack(spacing: 35) {
            HStack(spacing: 35) {
                Image("Dice 3")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 130)
                Image("Dice 1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 130)
            }
            Image("Dice 1")
                .resizable()
                .scaledToFit()
                .frame(height: 130)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
