//
//  User.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import Foundation

// MARK: - User
struct User: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let gamesPlayed: Int
    let winRatio: Double
    let achievements: [Achievement]
    let highestScore: Int
}

// MARK: - Achievement
struct Achievement: Identifiable, Codable, Hashable {
    let id: Int
    let image, name, description: String
    let achieved: Bool
}
