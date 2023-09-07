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
        
        let currentExpLabel = String(exp)
        let nextExpLabel = String(expToNextLevel)

        return "\(currentExpLabel)/\(nextExpLabel) \(NSLocalizedString("xp", bundle: .main, comment: ""))"
    }

    func getUserLevelLabel(db: DatabaseViewModel, exp: Int) -> String {
        return "\(NSLocalizedString("lvl", bundle: .main, comment: "")) \(getUserLevel(db: db, exp: exp))"
    }
    
    // MARK: SETTER

    func changeLanguage(locale: String) {
        Bundle.main.path(forResource: locale, ofType: "lproj")

        UserDefaults.standard.set([locale], forKey: "AppleLanguages")
        UserDefaults.standard.set(locale, forKey: "AppLanguage")
        UserDefaults.standard.synchronize()

        application.locale = locale
    }

    func addBadge(id: String) {
        // If user already has the badge, don't add it
        if (application.currentUser?.badges.contains(where: { $0 == id }) ?? false) {
            return
        }

        application.currentUser?.badges.append(id)
    }

    func hasBadge(id: String) -> Bool {
        return application.currentUser?.badges.contains(where: { $0 == id }) ?? false
    }

    func getSelectedUser() -> User? {
        return application.selectedUser
    }

    func setSelectedUser(user: User) {
        application.selectedUser = user
    }

    func resetSelectedUser() {
        application.selectedUser = nil
    }

    func setDarkMode() {
        application.colorScheme = .dark

        // Save to user defaults
        UserDefaults.standard.set("dark", forKey: "AppColorScheme")
        UserDefaults.standard.synchronize()
    }
    
    func setLightMode() {
        application.colorScheme = .light

        // Save to user defaults
        UserDefaults.standard.set("light", forKey: "AppColorScheme")
        UserDefaults.standard.synchronize()
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

    func saveUser(db: DatabaseViewModel) {
        db.saveUser(user: application.currentUser!)
    }

    func loadUser(db: DatabaseViewModel, game: GameViewModel) {
        let name = application.currentUserName

        if (application.currentUser != nil) {
            application.currentUser?.rounds.append(game.gm.currentRound)
            saveUser(db: db)
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

        // save name to user defaults
        UserDefaults.standard.set(name, forKey: "currentUserName")
        UserDefaults.standard.synchronize()
    }

    func reloadUser(db: DatabaseViewModel, game: GameViewModel) {
        application.currentUserName = application.currentUser!.name
        loadUser(db: db, game: game)
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
        changeLanguage(locale: "en")
    }

    func useVietnamese() {
        changeLanguage(locale: "vi")
    }

    func resetAll() {
        // Reset user defaults
        UserDefaults.standard.removeObject(forKey: "AppLanguage")
        UserDefaults.standard.removeObject(forKey: "AppColorScheme")
        UserDefaults.standard.synchronize()

        // Reset application
        application = Application()
    }
}
