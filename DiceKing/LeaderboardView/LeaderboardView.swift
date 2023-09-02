//
//  LeaderboardView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    @State var isShowingDetails = false
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Leaderboard")
                    .font(.system(size: 50).weight(.bold))
                    .foregroundColor(Color("yellow"))
                ScrollView {
                    ForEach(0..<10) { _ in
                        MemberRow()
                            .onTapGesture {
                                isShowingDetails.toggle()
                            }
                    }
                }
                .frame(height: 540)
                .scrollIndicators(.hidden)
            }
            .padding(.vertical, 30)
            .blur(radius: isShowingDetails ? 10 : 0)
        }
        .overlay {
            MemberDetailsView(isShowingDetails: $isShowingDetails)
                .opacity(isShowingDetails  ? 1 :  0)
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
