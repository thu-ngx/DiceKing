//
//  Badge.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 02/09/2023.
//

import Foundation

struct Badge {
    var name: String
    var description: String
    var imageName: String
}

let badges: [Badge] = [
    Badge(name: "Newbie", description: "Take your first steps into the dice world", imageName: "Newbie"),
    Badge(name: "Lucky 7s", description: "Roll a total of 7 with the 2 dice", imageName: "Lucky_7s"),
    Badge(name: "Snake eyes", description: "Roll double 1s", imageName: "Snake_Eyes"),
    Badge(name: "Grandmaster", description: "You've reached level 5 mastery of the dice", imageName: "Grandmaster"),
    Badge(name: "Victory", description: "Win 3 turns in a row", imageName: "Victory"),
    Badge(name: "Straight dices", description: "Rolling a straight (sequence like 3,4,5)", imageName: "Straight_Dices")
]
