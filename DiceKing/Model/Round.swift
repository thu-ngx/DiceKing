struct Round {
    var turnPoints: [Int]
    var currentLevel: Int
    
    init(turnPoints: [Int], currentLevel: Int) {
        self.turnPoints = turnPoints
        self.currentLevel = currentLevel
    }
}