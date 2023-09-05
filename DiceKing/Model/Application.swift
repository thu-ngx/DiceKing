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
    var showAccountSwitcher = false
    
    var locale: String = "en"
    var colorScheme: ColorScheme = .dark
}
