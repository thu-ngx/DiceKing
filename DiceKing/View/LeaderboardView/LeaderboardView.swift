//
//  LeaderboardView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel
    
    private let maxUsers = 99
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                Text(NSLocalizedString("leaderboard", bundle: .main, comment: ""))
                    .font(.system(size: 50).weight(.bold))
                    .foregroundColor(Color("yellow"))
                
                // Current user
                appVM.application.currentUser != nil ?
                MemberRow(user: appVM.application.currentUser!)
                    .onTapGesture {
                        appVM.setSelectedUser(user: appVM.application.currentUser!)
                    }
                : nil
                
                // Divider
                Rectangle()
                    .fill(Color("yellow").opacity(0.5))
                    .frame(width: 350, height: 2)
                    .padding(.vertical, 10)
                
                // Main leaderboard
                ForEach(dbVM.db.users.sorted(by: { $0.exp > $1.exp })
                    .prefix(maxUsers), id: \.self) { user in
                        MemberRow(user: user)
                            .onTapGesture {
                                appVM.setSelectedUser(user: user)
                            }
                    }
            }
            .scrollIndicators(.hidden)
            .padding(.vertical, 30)
            .blur(radius: appVM.getSelectedUser() != nil ? 10 : 0)
        }
        .overlay {
            MemberDetailsView()
                .opacity(appVM.getSelectedUser() != nil ? 1 :  0)
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .environmentObject(DatabaseViewModel())
    }
}
