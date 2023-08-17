//
//  User.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import Foundation

// MARK: - User
struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let gamesPlayed: Int
    let winRatio: Double
    let achievements: [String]
    let highestScore: Int
}
