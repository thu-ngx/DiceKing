//
//  GameView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct GameView: View {
    // MARK: app mode
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel
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
        let currentIndex = gameVM.getLastTurnIndex()

        let exp = appVM.getUserExp() ?? 0
        let (level, _) = dbVM.getLevel(exp: exp)
        
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            VStack {
                gameVM.isBetted() ?  HStack {
                    VStack(alignment: .leading) {
                        Text(gameVM.getBetRangeLabel())
                        Text(gameVM.getBetTypeLabel())
                    }
                    .font(.system(size: 20).weight(.heavy))
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(Color("yellow"))
                .padding(.horizontal, 30) : nil
                
                Spacer()
                
                // MARK: DICES
                DicesView(diceNames: gameVM.getDiceNames(turnIndex: currentIndex))
                
                Spacer()
                
                VStack (spacing: 5)  {
                    // MARK: BET AMOUNT
                    HStack (spacing: 0) {
                        Text(gameVM.isBetted() ? "Betted" : "Set a bet to continue...")
                            .foregroundColor(Color("yellow")) .font(.system(size: 26, weight: .semibold))
                        gameVM.isBetted() ? Image("coins")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40) : nil
                        gameVM.isBetted() ? Text(dbVM.getTotalBetLabel(level: level, hasOddOrEvenBet: gameVM.getOddOrEvenBet() != nil))
                            .foregroundColor(Color("yellow")) .font(.system(size: 26, weight: .semibold)) : nil
                    }
                    
                    // MARK: BET / ROLL
                    Button {
                        audioVM.playClickSound()
                        if (gameVM.isTurnCompleted()) {
                            if (gameVM.getCurrentPoints() < 0) {
                                isShowingLosingView = true
                                audioVM.playGameLostSound()
                            } else if (gameVM.isWon()) {
                                isShowingWinningView = true
                                audioVM.playGameWonSound()
                            } else {
                                gameVM.startNewTurn(db: dbVM, app: appVM)
                            }
                        } else if (gameVM.isBetted()) {
                            audioVM.playRollSound()
                            gameVM.rollDices(db: dbVM, audio: audioVM, level:level, turnIndex: currentIndex)
                        } else {
                            isShowingBetOption = true
                        }
                    } label: {
                        Text(gameVM.getRollOrBetLabel())
                            .font(.system(size: 40).weight(.heavy))
                            .foregroundColor(Color("yellow").opacity(
                                gameVM.gm.currentRound.turns.last!.isAnimating ? 0.5 : 1
                            ))
                            .padding(.horizontal, 50)
                            .padding(.vertical, 10)
                            .background(Color("red").opacity(
                                gameVM.gm.currentRound.turns.last!.isAnimating ? 0.5 : 1
                            ))
                            .cornerRadius(10)
                    }
                    .disabled(gameVM.gm.currentRound.turns.last!.isAnimating)
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
