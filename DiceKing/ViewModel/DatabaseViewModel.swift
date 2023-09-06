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
    
    func getUser(name: String) -> User? {
        return db.users.first(where: { $0.name == name })
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
    
    func deleteUser(name: String) {
        db.users.removeAll(where: { $0.name == name })
    }
    
    func getUserExp(name: String?) -> Int? {
        if name == nil {
            return nil
        }
        
        return getUser(name: name!)?.exp
    }
    
    func getTurnsCount(level: Int) -> Int {
        if (Constants.forceSingleTurn) {
            return 1
        }

        // starts at 5, every level, add 2, max at 15
        return min(5 + (level - 1) * 2, 15)
    }
    
    func getStartingCoins(level: Int) -> Int {
        // starts at 50, every next level, add 50, max at 500
        return min(50 + (level - 1) * 50, 500)
    }

    func getRangeBet(level: Int) -> Int {
        let startingCoins = getStartingCoins(level: level)
        return Int(Double(startingCoins) * Constants.rangeBetPercentage)
    }
    
    func getRangeBetLabel(level: Int) -> String {
        let rangeBet = getRangeBet(level: level)
        return String(rangeBet)
    }

    func getOddOrEvenBet(level: Int) -> Int {
        let startingCoins = getStartingCoins(level: level)
        return Int(Double(startingCoins) * Constants.oddOrEvenBetPercentage)
    }
    
    func getOddOrEvenBetLabel(level: Int) -> String {
        let oddOrEvenBet = getOddOrEvenBet(level: level)
        return String(oddOrEvenBet)
    }

    func getTotalBetLabel(level: Int, hasOddOrEvenBet: Bool) -> String {
        let startingCoins = getStartingCoins(level: level)
        let rangeBet = getRangeBet(level: level)
        let oddOrEvenBet = hasOddOrEvenBet ? getOddOrEvenBet(level: level) : 0
        return String(rangeBet + oddOrEvenBet)
    }
    
    func getLevel(exp: Int) -> (level: Int, expToNextLevel: Int) {
        guard exp >= 0 else {
            return (0, 0)
        }
        
        var level = 1
        var expToNextLevel = Constants.expPerLevel
        
        while exp >= expToNextLevel {
            level += 1
            expToNextLevel *= Constants.levelMultiplier
        }
        
        return (level, expToNextLevel)
    }
    
    func getExpToNextLevel(level: Int) -> Int {
        precondition(level > 0)
        
        var expToNextLevel = Constants.expPerLevel
        
        for _ in 2..<level {
            expToNextLevel *= Constants.levelMultiplier
        }
        
        return expToNextLevel
    }
    
    func getExpFromLevel(level: Int) -> Int {
        precondition(level > 0)
        
        var exp = 0
        var expToNextLevel = Constants.expPerLevel
        
        for _ in 1..<level {
            exp += expToNextLevel
            expToNextLevel *= Constants.levelMultiplier
        }
        
        return exp
    }
    
    func getCurrentExp(exp: Int, level: Int) -> Int {
        if level <= 1 {
            return exp
        }
        
        return exp - getExpFromLevel(level: level - 1)
    }
}
