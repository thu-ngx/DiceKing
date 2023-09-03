//
//  RangeOptionView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct RangeOptionView: View {
    @EnvironmentObject var applicationVM: ApplicationViewModel

    var dices: Int = 2
    var selectedRange: Int = 0
    
    var body: some View {
        VStack (spacing: 0) {
            //MARK: TITLE
            HStack (spacing: 0) {
                Text("Range: ")
                    .foregroundColor(Color("blue")) .font(.system(size: 26, weight: .semibold))
                Image("coins")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                Text("10")
                    .foregroundColor(Color("blue")) .font(.system(size: 26, weight: .semibold))
                Spacer()
            }
            
            //MARK: 3 OPTIONS
            HStack (spacing: 12) {
                ForEach(applicationVM.getRanges().indices, id: \.self) { index in
                    let range = applicationVM.getRanges()[index]
                    Button {
                        applicationVM.setSelectedRange(num: index)
                    } label: {
                        Text("\(range[0]) - \(range[1])")
                            .font(.system(size: 20).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .frame(width: 110)
                            .padding(.vertical, 5)
                            .background(Color("red").opacity(index == applicationVM.getSelectedRange() ? 1 : 0.5))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                    }
                }
            }
        }
        .padding(.vertical, 0)
        .padding(.horizontal, 10)
    }
}

struct RangeOptionView_Previews: PreviewProvider {
    static var previews: some View {
        RangeOptionView()
    }
}
