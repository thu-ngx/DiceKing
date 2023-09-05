//
//  ApplicationViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation
import SwiftUI

class ApplicationViewModel: ObservableObject {
    @Published var application = Application()
    
    // MARK: GETTER
    
    func getColorScheme() -> ColorScheme {
        return application.colorScheme
    }

    func getColorSchemeLabel() -> String {
        return application.colorScheme == .dark ? "Dark" : "Light"
    }
    
    // MARK: SETTER

    func setDarkMode() {
        application.colorScheme = .dark
    }
    
    func setLightMode() {
        application.colorScheme = .light
    }

    func resetAll() {
        application = Application()
    }
}
