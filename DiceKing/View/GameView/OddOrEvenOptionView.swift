//
//  OddOrEvenOptionView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct OddOrEvenOptionView: View {
    @EnvironmentObject var gameVM: GameViewModel
    
    var body: some View {
        VStack (spacing: 0) {
            
            //MARK: TITLE
            HStack (spacing: 0) {
                Text("Odd or even: ")
                    .foregroundColor(Color("blue")) .font(.system(size: 26, weight: .semibold))
                Image("coins")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                Text(gameVM.getOddOrEvenBet() == nil ? "0" : "5")
                    .foregroundColor(Color("blue")) .font(.system(size: 26, weight: .semibold))
                Spacer()
            }
            
            //MARK: 3 OPTIONS
            HStack (spacing: 12) {
                Button {
                    gameVM.resetDiceTypeBet()
                } label: {
                    Text("All")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 110)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(gameVM.getOddOrEvenBet() == nil ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(gameVM.getOddOrEvenBet() == nil)
                }
                
                Button {
                    gameVM.betOnOddSum()
                } label: {
                    Text("Odd")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 110)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(gameVM.getOddOrEvenBet() == false ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(gameVM.getOddOrEvenBet() == false)
                }
                
                Button {
                    gameVM.betOnEvenSum()
                } label: {
                    Text("Even")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 110)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(gameVM.getOddOrEvenBet() == true ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(gameVM.getOddOrEvenBet() == true)
                }
                
            }
        }
        .padding(.vertical, 0)
        .padding(.horizontal, 10)
    }
}

struct OddOrEvenOptionView_Previews: PreviewProvider {
    static var previews: some View {
        OddOrEvenOptionView()
    }
}
