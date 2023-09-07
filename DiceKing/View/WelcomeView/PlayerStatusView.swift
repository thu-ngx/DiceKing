//
//  PlayerStatusView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct PlayerStatusView: View {
    @EnvironmentObject var appVM: ApplicationViewModel
    @EnvironmentObject var dbVM: DatabaseViewModel

    var body: some View {
        HStack {
            Text(appVM.getUser()?.name ?? NSLocalizedString("unknown", bundle: .main, comment: ""))
                .font(.system(size: 24).weight(.heavy))
            Spacer()
            VStack(alignment: .trailing) {
                Text(appVM.getUserLevelLabel(db: dbVM, exp: appVM.getUserExp() ?? 0))
                Text(appVM.getUserExpLabel(db: dbVM, exp: appVM.getUserExp() ?? 0))
            }
            .font(.system(size: 20).weight(.heavy))
        }
        .foregroundColor(Color("yellow"))
        .padding(.horizontal, 30)
    }
}

struct PlayerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStatusView()
            .environmentObject(ApplicationViewModel())
            .environmentObject(DatabaseViewModel())
    }
}
