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

    // MARK: OTHER

    func isDefault() -> Bool {
        return application.locale == "en" && application.colorScheme == .dark
    }

    func getUser() -> User? {
        return application.currentUser
    }

    func getShowAccountSwitcher() -> Bool {
        return application.showAccountSwitcher
    }

    func hasUser() -> Bool {
        return application.currentUser != nil
    }

    func addUserExp(exp: Int) {
        application.currentUser?.exp += exp
    }

    func removeUserExp(exp: Int) {
        application.currentUser?.exp -= exp
    }

    func loadUser(db: DatabaseViewModel, game: GameViewModel) {
        let name = application.currentUserName

        if (application.currentUser != nil) {
            application.currentUser?.rounds.append(game.gm.currentRound)
            db.saveUser(user: application.currentUser!)
        }

        // Create new user if not exist
        if (!db.hasUser(name: name)) {
            db.createUser(name: name)
        }

        let nextUser = db.getUser(name: name)

        // Load user
        application.currentUser = nextUser

        // Load round
        game.gm.currentRound = db.getRound(user: nextUser)

        // Reset
        application.showAccountSwitcher = false
    }

    func addRound(round: Round) {
        application.currentUser?.rounds.append(round)
    }

    func useEnglish() {
        application.locale = "en"
    }

    func useVietnamese() {
        application.locale = "vi"
    }

    func resetAll() {
        application.colorScheme = .dark
        application.locale = "en"
    }
}
