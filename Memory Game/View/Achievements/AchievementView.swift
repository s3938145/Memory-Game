//
//  AchievementView.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import SwiftUI

struct AchievementView: View {
    var user: User
    
    var achievedAchievements: [Achievement] {
        return achievements.filter {
            $0.achieved == true
        }
    }
    
    var notYetAchievements: [Achievement] {
        return achievements.filter {
            $0.achieved == false
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Achieved")) {
                    ForEach(achievedAchievements){
                        AchievementRow(achievement: $0)
                    }
                }
                
                Section(header: Text("Not Yet Achieved")) {
                    ForEach(notYetAchievements) {
                        AchievementRow(achievement: $0)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .modifier(CenterToolBarTitleAchievement())
        }
    }
}

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView(user: users[0])
    }
}
