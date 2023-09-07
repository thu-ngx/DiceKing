//
//  DatabaseViewModel.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 05/09/2023.
//

import Foundation

class DatabaseViewModel: ObservableObject {
    @Published var db = Database()
    
    private let badges: [Badge] = [
        Badge(id: "NEWBIE", name: "Newbie", description: "Take your first steps into the dice world", image: "Newbie"),
        Badge(id: "LUCKY7", name: "Lucky 7s", description: "Roll a total of 7 with the 2 or more dices", image: "Lucky_7s"),
        Badge(id: "SNAKE_EYES", name: "Snake eyes", description: "Roll double 1s", image: "Snake_Eyes"),
        Badge(id: "GRANDMASTER", name: "Grandmaster", description: "You've reached level 5 mastery of the dice", image: "Grandmaster"),
        Badge(id: "VICTORIOUS", name: "Victorious", description: "Win 3 turns in a row", image: "Victory"),
        Badge(id: "STRAIGHT_DICES", name: "Straight dices", description: "Rolling a straight (sequence like 3-4-5)", image: "Straight_Dices")
    ]
    
    func getUsers() -> [User] {
        return db.users
    }
    
    func getBadges() -> [Badge] {
        return badges
    }
    
    func hasUser(name: String) -> Bool {
        return db.users.contains(where: { $0.name == name })
    }
    
    func createUser(name: String) {
        db.users.append(User(name: name))
    }
    
    func getUser(name: String) -> User? {
        return db.users.first(where: { $0.name == name })
    }
    
    func getUserRanking(name: String) -> Int {
        let user = getUser(name: name)
        let users = getUsers()
        let sortedUsers = users.sorted(by: { $0.exp > $1.exp })
        return sortedUsers.firstIndex(where: { $0.name == user?.name })! + 1
    }
    
    func getUserRankingLabel(name: String) -> String {
        let ranking = getUserRanking(name: name)
        return String(ranking)
    }
    
    func getUserTotalGames(name: String?) -> Int {
        if name == nil {
            return 0
        }
        
        let user = getUser(name: name!)
        return user?.rounds.count ?? 0
    }
    
    func getBadgeById(id: String) -> Badge {
        return badges.first(where: { $0.id == id }) ?? Badge(
            id: "NEWBIE",
            name: "Newbie",
            description: "Take your first steps into the dice world",
            image: "Newbie"
        )
    }
    
    func hasBadge(user: User, badges: [String], badge: Badge) -> Bool {
        // If badge id is NEWBIE, return true, because everyone has this badge
        if badge.id == "NEWBIE" {
            return true
        }
        
        // If badge id is GRANDMASTER, check if user's level is 5 or higher
        if badge.id == "GRANDMASTER" {
            let level = getLevel(exp: user.exp).level
            return level >= 5
        }
        
        // Otherwise, check if user's badges contains the badge id
        return badges.contains(where: { $0 == badge.id })
    }
    
    func isRoundWon(round: Round) -> Bool {
        // round is won if all turns' points are non-zero and turns.count is equal to totalTurns
        return round.turns.count == round.totalTurns && round.turns.allSatisfy({ $0.point != 0 })
    }
    
    func getUserWinrate(name: String?) -> Double {
        if name == nil {
            return 0
        }
        
        let user = getUser(name: name!)
        let totalGames = getUserTotalGames(name: name!)
        
        if totalGames == 0 {
            return 0
        }
        
        let totalWins = user?.rounds.filter({ isRoundWon(round: $0) }).count ?? 0
        return Double(totalWins) / Double(totalGames)
    }
    
    func getUserWinrateLabel(name: String?) -> String {
        let winrate = getUserWinrate(name: name)
        return String(format: "%.2f", winrate * 100) + "%"
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
    
    func getProgress(exp: Int) -> Double {
        let (_, expToNextLevel) = getLevel(exp: exp)
        return Double(exp) / Double(expToNextLevel)
    }
    
    // Save users to JSON file
    func saveUsers() {
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = docUrl.appendingPathComponent("users.json")
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let encoded = try? encoder.encode(db.users) {
            try? encoded.write(to: fileUrl)
        }

        print("Saved users to \(fileUrl.path)")

        // Verify that users are saved by printing them
        if let jsonData = try? Data(contentsOf: fileUrl) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([User].self, from: jsonData) {
                print("Loaded users from \(fileUrl.path)")
                print(decoded)
            }
        } else {
            print("Failed to load users from \(fileUrl.path)")
        }
    }
    
    // Load users from JSON file
    func loadUsers() {
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = docUrl.appendingPathComponent("users.json")
        
        // If file does not exist, load Constants.defaultUsers
        if !FileManager.default.fileExists(atPath: fileUrl.path) {
            db.users = Constants.defaultUsers
            return
        }

        // Otherwise, load users from file
        if let jsonData = try? Data(contentsOf: fileUrl) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([User].self, from: jsonData) {
                db.users = decoded
            }
        }

        // If file is empty, load Constants.defaultUsers
        if db.users.isEmpty {
            db.users = Constants.defaultUsers
        }
    }

    func resetAll() {
        db.users = Constants.defaultUsers
        saveUsers()
    }

    func isDefault() -> Bool {
        return db.users == Constants.defaultUsers
    }
}
