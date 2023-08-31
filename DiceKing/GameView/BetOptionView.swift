//
//  BetOptionView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct BetOptionView: View {
    
    @Binding var isShowingBetOption: Bool
    
    var body: some View {
        ZStack {
            Color("blue").opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            ZStack  {
                Color("yellow")
                VStack (spacing: 3) {
                    HStack {
                        Spacer()
                        Button {
                            isShowingBetOption = false
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                .frame(width: 65)
                        }
                        
                    }
                    
                    // MARK: TITLE
                    Text("Bet option")
                        .font(.system(size: 45).weight(.semibold))
                        .foregroundColor(Color(.black).opacity(0.7))
                        .padding(0)
                    
                    // MARK: RANGE
                    RangeOptionView()
                    
                    // MARK: ODD OR EVEN
                    OddOrEvenOptionView()
                    
                    Spacer()
                    
                    // MARK: BET BUTTON
                    Button {
                        print("Bet")
                        // save bet value
                        isShowingBetOption = false
                    } label: {
                        Text("Bet")
                            .font(.system(size: 25).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .frame(width: 100)
                            .padding(.vertical, 5)
                            .background(Color("red"))
                            .cornerRadius(10)
                    }
                }
                .padding(.vertical, 25)
            }
            .frame(height: 320)
            .cornerRadius(20)
            .padding(.horizontal, 90)
            
        }
    }
}



//struct BetOptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        BetOptionView()
//    }
//}
