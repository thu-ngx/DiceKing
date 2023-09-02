//
//  ProgressBar.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct ProgressBar: View {
    var body: some View {
        ZStack() {
            Color("gray")
            HStack {
                Rectangle()
                    .frame(width: 50, height: 15)
                    .foregroundColor(Color("yellow"))
                Spacer()
            }
        }
        .frame(width: 100, height: 15)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
