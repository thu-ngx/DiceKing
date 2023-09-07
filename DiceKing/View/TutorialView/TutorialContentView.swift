//
//  TutorialContentView.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct TutorialContentView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("\u{2022} \(NSLocalizedString("tut_1", bundle: .main, comment: ""))")
            Text("\u{2022} \(NSLocalizedString("tut_2", bundle: .main, comment: ""))")
            Text("\u{2022} \(NSLocalizedString("tut_3", bundle: .main, comment: ""))")
            Text("\u{2022} \(NSLocalizedString("tut_4", bundle: .main, comment: ""))")
            Text("\u{2022} \(NSLocalizedString("tut_5", bundle: .main, comment: ""))")
            Text("\u{2022} \(NSLocalizedString("tut_6", bundle: .main, comment: ""))")
        }
        .font(.system(size: 20).weight(.medium))
        .foregroundColor(Color("yellow"))
    }
}

struct TutorialContentView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialContentView()
    }
}
