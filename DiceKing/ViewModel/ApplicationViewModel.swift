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

    func getUserExpLabel(db: DatabaseViewModel, exp: Int) -> String {
        let (level, expToNextLevel) = db.getLevel(exp: exp)
        
        let currentExp = db.getCurrentExp(exp: exp, level: level)

        let currentExpLabel = String(currentExp)
        let nextExpLabel = String(expToNextLevel)

        return "\(currentExpLabel)/\(nextExpLabel) EXP"
    }

    func getUserLevelLabel(db: DatabaseViewModel, exp: Int) -> String {
        return "Level \(getUserLevel(db: db, exp: exp))"
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

    func getUserExp() -> Int? {
        return application.currentUser?.exp
    }

    func getUserLevel(db: DatabaseViewModel, exp: Int) -> Int {
        let (level, _) = db.getLevel(exp: exp)
        return level
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

        let nextUser = db.getUser(name: name)!

        // Load user
        application.currentUser = nextUser

        // Load round
        let round = db.getRound(user: nextUser)
        game.setupRound(db: db, round: round, user: nextUser)

        // Reset
        application.showAccountSwitcher = false
    }

    func deleteUser(db: DatabaseViewModel) {
        if (application.currentUser == nil) {
            return
        }

        db.deleteUser(name: application.currentUser!.name)
        application.currentUser = nil
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
