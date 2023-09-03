//
//  WinningView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct WinningView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @Binding var isShowingWinningView: Bool
    
    var body: some View {
        ZStack {
            Color("transparent-green")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("VICTORY")
                    .font(.system(size: 93).weight(.bold))
                    .foregroundColor(Color("bright-yellow"))
                    .rotationEffect(.degrees(-35))
                    .shadow(color: Color("yellow").opacity(0.3), radius: 10, x: 0, y: 2)
                    .offset(y:-100)
                 Text("+20 Exp")
                    .font(.system(size: 50).weight(.semibold))
                    .foregroundColor(Color("yellow"))
                    .offset(y:-50)
                Button {
                    isShowingWinningView = false
                } label: {
                    Text("Tap to continue")
                        .font(.system(size: 30).weight(.medium))
                        .foregroundColor(Color("yellow"))
                        .offset(y:50)
                }

            }
        }
    }
}

//struct WinningView_Previews: PreviewProvider {
//    static var previews: some View {
//        WinningView()
//    }
//}
