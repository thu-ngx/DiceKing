//
//  GameView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct GameView: View {
    // MARK: app mode
    @EnvironmentObject var gameVM: GameViewModel
    
    // MARK: check showing bet option & result view
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
                DicesView(diceNames: gameVM.gm.currentRound.turns.last!.getDiceNames())
                
                Spacer()
                
                VStack (spacing: 5)  {
                    // MARK: BET AMOUNT
                    gameVM.isBetted() ?
                    HStack (spacing: 0) {
                        Text("Bet")
                            .foregroundColor(Color("yellow")) .font(.system(size: 26, weight: .semibold))
                        Image("coins")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                        Text(gameVM.getTotalBetLabel())
                            .foregroundColor(Color("yellow")) .font(.system(size: 26, weight: .semibold))
                    } : nil
                    
                    // MARK: BET / ROLL
                    Button {
                        if (gameVM.isBetted()) {
                            gameVM.rollDices()
                            
                            // if (appVM.getCurrentPoint() <= 0) {
                            //     isShowingLosingView = true
                            // } else if (appVM.getIsWin()) {
                            //     isShowingWinningView = true
                            // }
                        } else {
                            isShowingBetOption = true
                        }
                    } label: {
                        Text(gameVM.getRollOrBetLabel())
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
                        Text("\(gameVM.getCurrentPoints())")
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
struct DicesView: View {
    var diceNames: [String]
    
    var body: some View {
        VStack(spacing: 35) {
            ForEach(0..<diceNames.count/2 + diceNames.count%2, id: \.self) { row in
                HStack(spacing: 30) {
                    ForEach(0..<2, id: \.self) { column in
                        let index = row * 2 + column
                        if index < diceNames.count {
                            Image(diceNames[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 130)
                        }
                    }
                }
            }
        }
    }
}
//
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
