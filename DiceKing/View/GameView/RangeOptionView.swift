//
//  RangeOptionView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct RangeOptionView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel
    @EnvironmentObject var gameVM: GameViewModel
    
    func compareRanges(range1: [Int]?, range2: [Int]?) -> Bool {
        if (range1 == nil || range2 == nil) {
            return false
        }
        
        return range1?[0] == range2?[0] && range1?[1] == range2?[1]
    }
    
    var body: some View {
        let exp = appVM.getUserExp() ?? 0
        let (level, _) = dbVM.getLevel(exp: exp)
        
        VStack (spacing: 0) {
            //MARK: TITLE
            HStack (spacing: 0) {
                Text("\(NSLocalizedString("bet_range", bundle: .main, comment: "")): ")
                    .foregroundColor(Color("blue")) .font(.system(size: 26, weight: .semibold))
                Image("coins")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                Text(dbVM.getRangeBetLabel(level: level))
                    .foregroundColor(Color("blue")) .font(.system(size: 26, weight: .semibold))
                Spacer()
            }
            
            //MARK: 3 OPTIONS
            HStack (spacing: 12) {
                ForEach(gameVM.getRanges(), id: \.self) { range in
                    Button {
                        audioVM.playClickSound()
                        gameVM.setSelectedRange(range: range)
                    } label: {
                        Text("\(range[0]) - \(range[1])")
                            .font(.system(size: 20).weight(.heavy))
                            .foregroundColor(Color("yellow"))
                            .frame(width: 110)
                            .padding(.vertical, 5)
                            .background(Color("red").opacity(compareRanges(range1: range, range2: gameVM.gm.currentRound.turns.last?.selectedRange ?? gameVM.getRanges()[gameVM.getSelectedRangeIndex() ?? 0]) ? 1 : 0.5))
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
            .environmentObject(ApplicationViewModel())
            .environmentObject(DatabaseViewModel())
            .environmentObject(AudioViewModel())
            .environmentObject(GameViewModel())
    }
}
