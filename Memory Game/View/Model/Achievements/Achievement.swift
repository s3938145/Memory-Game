//
//  Achievement.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-16.
//

import Foundation

//MARK: - Achievement
struct Achievement: Identifiable, Codable {
    var id: Int
    var image, name, description: String
    var achieved: Bool
}
