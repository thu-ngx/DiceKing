//
//  DatabaseViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 05/09/2023.
//

import Foundation

class DatabaseViewModel: ObservableObject {
    @Published var db = Database()

    func hasUser(name: String) -> Bool {
        return db.users.contains(where: { $0.name == name })
    }

    func createUser(name: String) {
        db.users.append(User(name: name))
    }

    func getUser(name: String) -> User {
        return db.users.first(where: { $0.name == name })!
    }

    func getRound(user: User) -> Round {
        return user.rounds.last ?? Round()
    }

    func saveUser(user: User) {
        // loop through users
        for i in 0..<db.users.count {
            // if user name matches
            if db.users[i].name == user.name {
                db.users[i] = user
                return
            }
        }
    }
}
