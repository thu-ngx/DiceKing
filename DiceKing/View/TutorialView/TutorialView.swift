//
//  TutorialView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct TutorialView: View {
    @EnvironmentObject var audioVM: AudioViewModel
    
    @State var showPointDetailsSheet = false
    @State var showAchievementsDetailsSheet = false
    
    var body: some View {
        ZStack {
            Color("blue")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                // MARK: TITLE
                Text("Tutorial")
                    .font(.system(size: 50).weight(.bold))
                    .foregroundColor(Color("yellow"))
                    .padding(.bottom, 30)
                
                // MARK: CONTENT
                TutorialContentView()
                
                LazyVGrid(columns: [GridItem()], spacing: 8) {
                    Button(action: {
                        showPointDetailsSheet = true
                        audioVM.playClickSound()
                    }) {
                        Text("Levels & Exp")
                            .font(.system(size: 18).weight(.heavy))
                            .foregroundColor(Color("blue"))
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(Color("yellow"))
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showPointDetailsSheet) {  PointDetailsSheetView(isPresented: $showPointDetailsSheet)}
                    
                    Button(action: {
                        showAchievementsDetailsSheet = true
                        audioVM.playClickSound()
                    }) {
                        Text("Achievements")
                            .font(.system(size: 18).weight(.heavy))
                            .foregroundColor(Color("blue"))
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(Color("yellow"))
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showAchievementsDetailsSheet) {  AchievementsDetailsSheetView(isPresented: $showAchievementsDetailsSheet)}
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 30)
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
