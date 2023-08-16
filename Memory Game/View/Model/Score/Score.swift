//
//  Score.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

import Foundation

// MARK: - Score
struct Score: Identifiable, Codable {
    var id: Int
    var name: String
    var points: Int
}

