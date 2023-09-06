//
//  User.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 05/09/2023.
//

import Foundation

struct User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    var name: String
    var exp: Int = 0
    var badges: [String] = []
    var rounds: [Round] = []
}
