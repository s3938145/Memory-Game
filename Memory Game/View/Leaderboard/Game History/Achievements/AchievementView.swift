//
//  AchievementView.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import SwiftUI

struct AchievementView: View {
    @State var isExpanded = false
    @State var subviewHeight : CGFloat = 0
    
    var user: User
    
    var achievedAchievements: [Achievement] {
        return user.achievements.filter {
            $0.achieved == true
        }
    }
    
    var notYetAchievements: [Achievement] {
        return user.achievements.filter {
            $0.achieved == false
        }
    }
    
    var body: some View {
        VStack {
            Text("Achievements")
                .frame(width: 250, height: 50)
                .background(Color(red: 0, green: 0.5, blue: 0.5).opacity(0.7)).cornerRadius(20)
                .font(.system(size: 30))
                .padding(.bottom, 20)
            VStack {
                Section(header: Text("Achieved")) {
                    ForEach(achievedAchievements, id: \.self){
                        AchievementRow(achievement: $0)
                    }
                }
                
                Section(header: Text("Not Yet Achieved")) {
                    ForEach(notYetAchievements, id: \.self) {
                        AchievementRow(achievement: $0)
                    }
                }
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
        AchievementView(user: users[0])
    }
}
