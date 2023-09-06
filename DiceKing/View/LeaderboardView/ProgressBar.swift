//
//  ProgressBar.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat = 0.5

    var body: some View {
        ZStack() {
            Color("gray")
            HStack {
                Rectangle()
                    .frame(width: progress * 100, height: 10)
                    .foregroundColor(Color("yellow"))
                Spacer()
            }
        }
        .frame(width: 100, height: 10)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
