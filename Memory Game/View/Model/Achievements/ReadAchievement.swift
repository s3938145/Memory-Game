//
//  ReadAchievement.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-16.
//

import Foundation

var achievements = decodeAchievementJson(jsonFileName: "achievements.json")

func decodeAchievementJson(jsonFileName: String) -> [Achievement] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Achievement].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Achievement]
}
