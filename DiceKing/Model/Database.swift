//
//  Database.swift
//  DiceKing
//
//  Created by Thu Nguyen  on 05/09/2023.
//

import Foundation

class Database {
    var users: [User] = defaultUsers
}

var defaultUsers: [User] = [
    User(name: "Thu", exp: 5000, badges: [], rounds: []),
    User(name: "Huy", exp: 80, badges: [], rounds: []),
    User(name: "Hieu", exp: 280, badges: [], rounds: []),
    User(name: "Hoa", exp: 160, badges: [], rounds: []),
    User(name: "Hai", exp: 240, badges: [], rounds: []),
    User(name: "Hien", exp: 200, badges: [], rounds: []),
    User(name: "Phuc", exp: 1200, badges: [], rounds: []),
    User(name: "Lam", exp: 400, badges: [], rounds: []),
    User(name: "Kha", exp: 480, badges: [], rounds: []),
    User(name: "Anh", exp: 360, badges: [], rounds: []),
    User(name: "Son", exp: 600, badges: [], rounds: []),
    User(name: "Tuan", exp: 520, badges: [], rounds: []),
    User(name: "Xuan", exp: 1360, badges: [], rounds: []),
    User(name: "Loc", exp: 960, badges: [], rounds: []),
    User(name: "Han", exp: 1520, badges: [], rounds: []),
    User(name: "Hung", exp: 720, badges: [], rounds: []),
    User(name: "Vy", exp: 760, badges: [], rounds: []),
    User(name: "Vinh", exp: 40, badges: [], rounds: []),
    User(name: "Ngoc", exp: 0, badges: [], rounds: []),
    User(name: "Huong", exp: 80, badges: [], rounds: []),
    User(name: "Huyen", exp: 40, badges: [], rounds: []),
    User(name: "Khang", exp: 0, badges: [], rounds: []),
    User(name: "Khanh", exp: 40, badges: [], rounds: []),
]