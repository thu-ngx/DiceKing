//
//  AchievementsDetailsSheetView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 01/09/2023.
//

import SwiftUI

struct AchievementsDetailsSheetView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel
    @EnvironmentObject var audioVM: AudioViewModel
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isPresented = false
                        audioVM.playClickSound()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .frame(width: 20)
                            .foregroundColor(Color("yellow"))
                    }
                }
                .padding(.vertical, 20)
                Text(NSLocalizedString("badges", bundle: .main, comment: ""))
                    .font(.system(size: 30).weight(.medium))
                    .padding(.bottom, 30)
                    .foregroundColor(Color("yellow"))
                
                ScrollView {
                    VStack (alignment: .leading, spacing: 18) {
                        ForEach(dbVM.getBadges(), id: \.name) { badge in
                            BadgeView(badge: badge, unlocked: dbVM.hasBadge(user: appVM.application.currentUser!, badges: appVM.application.currentUser?.badges ?? [], badge: badge))
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

// MARK: BADGE VIEW
struct BadgeView : View {
    var badge: Badge
    var unlocked: Bool = false
    
    var body: some View {
        HStack (spacing: 12) {
            Image("\(badge.image)")
                .resizable()
                .scaledToFit()
                .frame(width: 70)
                .opacity(unlocked ? 1 : 0.3)
            
            VStack (alignment: .leading) {
                Text(NSLocalizedString(badge.id, bundle: .main, comment: ""))
                    .font(.system(size: 25).weight(.bold))
                Text(NSLocalizedString("\(badge.id)_description", bundle: .main, comment: ""))
                    .font(.system(size: 18).weight(.medium))
            }
            
            Spacer()
            
            if unlocked {
                Image(systemName: "checkmark")
                    .font(.system(size: 30))
                    .foregroundColor(Color("yellow"))
            }
        }
        .foregroundColor(Color("yellow").opacity(unlocked ? 1 : 0.3))
    }
}

// MARK: MINI BADGE VIEW
struct MiniBadgeView : View {
    var badge: Badge
    var unlocked: Bool = false
    
    var body: some View {
        HStack (spacing: 12) {
            Image("\(badge.image)")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .opacity(unlocked ? 1 : 0.3)
            
            if unlocked {
                Image(systemName: "checkmark")
                    .font(.system(size: 20))
                    .foregroundColor(Color("yellow"))
            }
        }
        .foregroundColor(Color("yellow").opacity(unlocked ? 1 : 0.3))
    }
}