//
//  Difficulty.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//

import Foundation

enum Difficulty: Int, CaseIterable {
    case easy = 10
    case medium = 25
    case hard = 40
    
    var description: String {
        switch self {
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }
}
