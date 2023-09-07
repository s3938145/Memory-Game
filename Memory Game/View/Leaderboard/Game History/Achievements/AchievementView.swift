//
//  AchievementView.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import SwiftUI

struct AchievementView: View {
    
    @StateObject private var userVM = UserViewModel()
    @StateObject private var achievementVM = AchievementViewModel()
    
    @State var isExpanded = false
    @State var subviewHeight : CGFloat = 0
    
    var user: User
    
    var achievedAchievements: [Achievement] = []
    
    var body: some View {
        VStack {
            Text("Achievements")
                .frame(width: 250, height: 50)
                .background(Color(red: 0, green: 0.5, blue: 0.5).opacity(0.7)).cornerRadius(20)
                .font(.system(size: 30))
                .padding(.bottom, 20)
            VStack {
                Section(header: Text("")) {
                    ForEach(achievementVM.achievements, id: \.self){
                        AchievementRow(achievement: $0)
                    }
                }
            }
            .onDisappear(){
                achievementVM.resetAchievement()
            }
            .onAppear() {
                achievementVM.setAchievement(easyWins: user.easyWins, mediumWins: user.mediumWins, hardWins: user.hardWins)
            }
        }
        .background(GeometryReader {
            Color.clear.preference(key: ViewHeightKey.self,
                                   value: $0.frame(in: .local).size.height)
        })
        .onPreferenceChange(ViewHeightKey.self) { subviewHeight = $0 }
        .frame(height: isExpanded ? subviewHeight : 50, alignment: .top)
        .padding()
        .clipped()
        .frame(maxWidth: .infinity)
        .transition(.move(edge: .bottom))
        .background(Color.clear.cornerRadius(10.0))
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.6)) {
                isExpanded.toggle()
            }
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView(user: .init(id: 1, name: "Will", gamesPlayed: 10, easyWins: 7, mediumWins: 2, hardWins: 1, totalWins: 10, winRatio: 1.0, currentScore: 0, highestScore: 10))
    }
}
