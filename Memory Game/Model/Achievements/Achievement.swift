//
//  achievements.swift
//  Memory Game
//
//  Created by Binh Ngo on 05/09/2023.
//

import Foundation

struct Achievement: Identifiable, Codable, Hashable {
    let id: Int
    let image, name, description: String
    var achieved: Bool
}
