//
//  User.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import Foundation

// MARK: - User
struct User: Identifiable, Codable, Hashable{
    let id: Int
    let name: String
    var gamesPlayed, easyWins, mediumWins, hardWins, totalWins: Int
    var winRatio: Double
    var currentScore: Int
    var highestScore: Int
}

