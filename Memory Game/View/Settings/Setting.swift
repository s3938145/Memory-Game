/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Ngo Chi Binh
  ID: s3938145
  Created  date: 15/08/2023
  Last modified: 07/09/2023
  Acknowledgement: N/A
*/

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
