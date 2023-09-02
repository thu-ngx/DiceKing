//
//  MemberRow.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct MemberRow: View {
    var body: some View {
        ZStack {
            Color("dark-blue")
            HStack {
                Text("nguyensusu")
                    .font(.system(size: 25).weight(.heavy))
                    .foregroundColor(Color("yellow"))
                    .frame(width: 150)
                Spacer()
                VStack (alignment: .leading, spacing: 0) {
                    Text("9999")
                        .font(.system(size: 20).weight(.medium))
                        .foregroundColor(Color(.white))
                    ProgressBar()
                }
            }
            .padding(.horizontal)
        }
        .frame(width:350, height: 70)
        .cornerRadius(10)
    }
}

struct MemberRow_Previews: PreviewProvider {
    static var previews: some View {
        MemberRow()
    }
}
