class User {
    var name: String
    var exp: Int
    var pastRounds: [Round]
    
    init(name: String, exp: Int, pastRounds: [Round]) {
        self.name = name
        self.exp = exp
        self.pastRounds = pastRounds
    }
}