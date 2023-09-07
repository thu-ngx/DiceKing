//
//  BadgesList.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct BadgesList: View {
    @EnvironmentObject var dbVM: DatabaseViewModel

    var unlockedBadges: [String] = []
    
    var body: some View {
        HStack (spacing: 0) {
            ForEach(dbVM.getBadges(), id: \.name) { badge in
                Image(badge.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.horizontal, 5)
                    .opacity(unlockedBadges.contains(badge.id) ? 1 : 0.3)
            }
        }
    }
}

struct BadgesList_Previews: PreviewProvider {
    static var previews: some View {
        BadgesList()
    }
}
