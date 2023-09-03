//
//  AchievementsDetailsSheetView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 01/09/2023.
//

import SwiftUI

struct AchievementsDetailsSheetView: View {
    @Binding var isPresented: Bool
    
    let badges: [Badge] = [
        Badge(name: "Newbie", description: "Take your first steps into the dice world", imageName: "Newbie"),
        Badge(name: "Lucky 7s", description: "Roll a total of 7 with the 2 dice", imageName: "Lucky_7s"),
        Badge(name: "Snake eyes", description: "Roll double 1s", imageName: "Snake_Eyes"),
        Badge(name: "Grandmaster", description: "You've reached level 5 mastery of the dice", imageName: "Grandmaster"),
        Badge(name: "Victory", description: "Win 3 turns in a row", imageName: "Victory"),
        Badge(name: "Straight dices", description: "Rolling a straight (sequence like 3,4,5)", imageName: "Straight_Dices")
    ]
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .frame(width: 20)
                            .foregroundColor(Color("yellow"))
                    }
                }
                .padding(.vertical, 20)
                Text("List of achievements")
                    .font(.system(size: 30).weight(.medium))
                    .padding(.bottom, 30)
                    .foregroundColor(Color("yellow"))
                
                ScrollView {
                    VStack (alignment: .leading, spacing: 18) {
                        ForEach(badges, id: \.name) { badge in
                            BadgeView(imgName: badge.imageName, name: badge.name, description: badge.description)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct Badge {
    var name: String
    var description: String
    var imageName: String
}

// MARK: BADGE VIEW
struct BadgeView : View {

    var imgName: String
    var name: String
    var description: String

    var body: some View {
        HStack (spacing: 12) {
                Image("\(imgName)")
                .resizable()
                .scaledToFit()
                .frame(width: 70)
            VStack (alignment: .leading) {
                Text("\(name)")
                    .font(.system(size: 25).weight(.bold))
                Text("\(description)")
                    .font(.system(size: 18).weight(.medium))
            } 
        }
        .foregroundColor(Color("yellow"))
        
    }
}



//struct AchievementsDetailsSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        AchievementsDetailsSheetView()
//    }
//}
