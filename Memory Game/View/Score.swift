//
//  Score.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

import Foundation

struct Score: Codable {
    var scores: [ScoreElement]
}

struct ScoreElement: Codable {
    var id: Int
    var name: String
    var point: Int
}
