//
//  Setting.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//

import SwiftUI
import Combine

class Settings: ObservableObject {
    let difficultyKey = "difficulty"
    
    @Published var difficulty: Difficulty? {
        didSet {
            if let rawValue = difficulty?.rawValue {
                UserDefaults.standard.set(rawValue, forKey: difficultyKey)
            }
        }
    }
    
    init() {
        if let rawValue = UserDefaults.standard.value(forKey: difficultyKey) as? Int {
            difficulty = Difficulty(rawValue: rawValue)
        }
    }
}
