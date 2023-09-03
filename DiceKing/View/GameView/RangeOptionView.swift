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
    
    func getRanges(dices: Int) -> [[Int]] {
        let numberOfRanges = 3
        var ranges: [[Int]] = []
        
        // Initialize ranges
        for _ in 0..<numberOfRanges {
            ranges.append([])
        }
        
        let min = dices
        let max = dices * 6
        let diff = max - min
        
        let range = diff / 3
        let remainder = diff % 3
        
        // first range
        ranges[0].append(min)
        ranges[0].append(min + range)
        
        // second range
        ranges[1].append(min + range + 1)
        ranges[1].append(min + range * 2 + remainder)
        
        // third range
        ranges[2].append(min + range * 2 + remainder + 1)
        ranges[2].append(max)
        
        return ranges
    }
    
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
            HStack (spacing: 20) {
                ForEach(getRanges(dices: applicationVM.getDices().count).indices, id: \.self) { index in
                    let range = getRanges(dices: applicationVM.getDices().count)[index]
                    Button {
                        applicationVM.setSelectedRange(num: index)
                    } label: {
                        Text("\(range[0]) - \(range[1])")
                            .font(.system(size: 20).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .frame(width: 100)
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
