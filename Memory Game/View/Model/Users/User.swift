//
//  User.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import Foundation

// MARK: - User
struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var gamesPlayed: Int
    var winRatio: Double
    var achievements: [String]
    var highestScore: Int
}
