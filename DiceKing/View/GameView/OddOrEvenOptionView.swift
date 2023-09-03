//
//  OddOrEvenOptionView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct OddOrEvenOptionView: View {
    @EnvironmentObject var applicationVM: ApplicationViewModel
    
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
                Text(applicationVM.getIsEvenNumber() == nil ? "0" : "5")
                    .foregroundColor(Color("blue")) .font(.system(size: 26, weight: .semibold))
                Spacer()
            }
            
            //MARK: 3 OPTIONS
            HStack (spacing: 20) {
                Button {
                    applicationVM.resetDiceType()
                } label: {
                    Text("All")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 100)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(applicationVM.getIsEvenNumber() == nil ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(applicationVM.getIsEvenNumber() == nil)
                }
                
                Button {
                    applicationVM.setOddNumber()
                } label: {
                    Text("Odd")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 100)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(applicationVM.getIsEvenNumber() == false ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(applicationVM.getIsEvenNumber() == false)
                }
                
                Button {
                    applicationVM.setEvenNumber()
                } label: {
                    Text("Even")
                        .font(.system(size: 20).weight(.heavy))
                        .foregroundColor(Color("yellow"))
                        .frame(width: 100)
                        .padding(.vertical, 5)
                        .background(Color("red").opacity(applicationVM.getIsEvenNumber() == true ? 1 : 0.5))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                        .disabled(applicationVM.getIsEvenNumber() == true)
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
