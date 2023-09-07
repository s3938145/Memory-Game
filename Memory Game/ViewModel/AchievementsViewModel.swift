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

import Foundation

class AchievementViewModel: ObservableObject {
    @Published var achievements = [Achievement]() {
        didSet {
            saveAchievementData()
        }
    }
    
    
    let achievementDataKey: String = "achievementData"
    
    
    init() {
        
//        achievements = loadAchievementData()
        
        loadAchievementData()
    }
    
    
    func achievedAchievement(name: String) {
        if let i = achievements.firstIndex(where: {$0.name == name}) {
            achievements[i].achieved = true
        }
    }
    
    
    func setAchievement(easyWins: Int, mediumWins: Int ,hardWins: Int) {
        if easyWins > 0 {
            achievedAchievement(name: "Easy Peasy")
        }
        
        if mediumWins > 0 {
            achievedAchievement(name: "Premium Medium")
        }
        
        if hardWins > 0 {
            achievedAchievement(name: "Hard Earned Victory")
        }
    }
    
    
    func resetAchievement() {
        for (i, _) in achievements.enumerated() {
            achievements[i].achieved = false
        }
    }
    
    func saveAchievementData() {
        let encoder = JSONEncoder()
        if let achievementJSONData = try? encoder.encode(achievements) {
            UserDefaults.standard.set(achievementJSONData, forKey: achievementDataKey)
        } else {
            return
        }
    }
    
//    Load data from UserDefault
    func loadAchievementData() {
        guard
            let data = UserDefaults.standard.data(forKey: achievementDataKey),
            let decoded = try? JSONDecoder().decode([Achievement].self, from: data)
        else {
            return
        }
        self.achievements = decoded
    }
    
//  Load data from JSON file

//    func loadAchievementData() -> [Achievement] {
//        if let file = Bundle.main.url(forResource: "achievements", withExtension: "json") {
//            if let data = try? Data(contentsOf: file) {
//                do {
//                    let decoder = JSONDecoder()
//                    let decoded = try decoder.decode([Achievement].self, from: data)
//                    return decoded
//                } catch let error {
//                    fatalError("Failed to decode JSON: \(error)")
//                }
//            }
//        } else {
//            fatalError("Couldn't load achievement.json file")
//        }
//        return [ ] as [Achievement]
//    }
    
}
