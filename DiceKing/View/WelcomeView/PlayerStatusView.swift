//
//  PlayerStatusView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct PlayerStatusView: View {
    @EnvironmentObject var appVM: ApplicationViewModel

    var body: some View {
        HStack {
            Text(appVM.getUser()?.name ?? "Unknown")
                .font(.system(size: 32).weight(.heavy))
            Spacer()
            VStack(alignment: .leading) {
                // Text("Level 1")
                Text("Exp: \(appVM.getUser()?.exp ?? 0)")
            }
            .font(.system(size: 27).weight(.heavy))
        }
        .foregroundColor(Color("yellow"))
        .padding(.horizontal, 30)
    }
}

struct PlayerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStatusView()
    }
}
