//
//  Modifiers.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 31/08/2023.
//

import SwiftUI

struct OptionButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20).weight(.heavy))
            .foregroundColor(Color("yellow"))
            .frame(width: 100)
            .padding(.vertical, 5)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}
