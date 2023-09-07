//
//  Application.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation
import SwiftUI

struct Application {
    var currentUser: User? = nil
    var currentUserName: String = "Thu"

    var selectedUser: User? = nil

    var showAccountSwitcher = false
    
    var locale: String = UserDefaults.standard.string(forKey: "AppLanguage") ?? "en"
    var colorScheme: ColorScheme = .dark
}
