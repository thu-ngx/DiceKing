//
//  MemberRow.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct MemberRow: View {
    @EnvironmentObject var db: DatabaseViewModel

    var user: User

    var body: some View {
        ZStack {
            Color("dark-blue")
            HStack {
                Text(db.getUserRankingLabel(name: user.name))
                    .font(.system(size: 25).weight(.heavy))
                    .foregroundColor(Color("yellow"))
                    .frame(width: 50)
                Text(user.name)
                    .font(.system(size: 25).weight(.heavy))
                    .foregroundColor(Color("yellow"))
                    .frame(width: 150)
                Spacer()
                VStack (alignment: .leading, spacing: 0) {
                    Text("\(user.exp) XP")
                        .font(.system(size: 20).weight(.medium))
                        .foregroundColor(Color(.white))
                    ProgressBar(progress: CGFloat(db.getProgress(exp: user.exp)))
                }
            }
            .padding(.horizontal)
        }
        .frame(width:350, height: 70)
        .cornerRadius(10)
    }
}
