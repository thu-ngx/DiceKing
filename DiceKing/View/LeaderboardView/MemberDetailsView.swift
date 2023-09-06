//
//  MemberDetailsView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct MemberDetailsView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel

    var body: some View {
        ZStack {
            Color("blue").opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            ZStack  {
                Color("yellow")
                VStack ( spacing: 7) {
                    // MARK: CLOSE ICON
                    HStack {
                        Spacer()
                        Button {
                            appVM.resetSelectedUser()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                .frame(width: 20)
                        }
                        
                    }
                    
                    //MARK: player name
                    Text(appVM.getSelectedUser()?.name ?? "Player")
                        .font(.system(size: 35).weight(.bold))
                        .offset(y: -10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        //MARK: exp & level
                        HStack {
                            Text(appVM.getUserExpLabel(db: dbVM, exp: appVM.getSelectedUser()?.exp ?? 0))
                            Spacer()
                            Text(appVM.getUserLevelLabel(db: dbVM, exp: appVM.getSelectedUser()?.exp ?? 0))
                        }
                        
                        //MARK: badges
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Badges")
                            BadgesList()
                        }
                        
                        //MARK: games played
                        Text("Games played: \(dbVM.getUserTotalGames(name: appVM.getSelectedUser()?.name))")
                        
                        //MARK: win percentage
                        Text("Win percentage: \(dbVM.getUserWinrateLabel(name: appVM.getSelectedUser()?.name))")
                    }
                    .font(.system(size: 25).weight(.medium))
                }
                // .padding(.vertical, 0)
                .padding(.horizontal, 25)
                .foregroundColor(Color("blue"))
            }
            .frame(width: 320, height: 330)
            .cornerRadius(20)
        }
    }
}

//struct MemberDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemberDetailsView()
//    }
//}
