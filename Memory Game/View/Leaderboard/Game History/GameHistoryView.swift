//
//  GameHistoryView.swift
//  Memory Game
//
//  Created by Binh Ngo on 17/08/2023.
//

import SwiftUI

struct GameHistoryView: View {
    var user: User
    
    var body: some View {
        VStack {
                Section {
                    Text("Username: \(user.name)")
                    Text("Games Played: \(user.gamesPlayed.description)")
                    Text("Win Rate: \(user.winRatio.description)")
                    Text("Highest score \(user.highestScore.description)")
                }
                .font(.system(size: 25))
                ScrollView {
                    AchievementView(user: user.self)
                }
            }
            .padding(.top, 180)
            .modifier(CenterToolBarTitle(text: "Game History"))
    }
}

struct GameHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        GameHistoryView(user: users[0])
    }
}
