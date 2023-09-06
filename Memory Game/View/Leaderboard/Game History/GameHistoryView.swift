//
//  GameHistoryView.swift
//  Memory Game
//
//  Created by Binh Ngo on 17/08/2023.
//

import SwiftUI

struct GameHistoryView: View {
    
    @StateObject var userVM = UserViewModel()
    
    @State var user: User
    
    var body: some View {
        VStack {
                Section {
                    Text("Username: \(user.name)")
                    Text("Games Played: \(user.gamesPlayed.description)")
                    Text("Wins on Easy: \(user.easyWins)")
                    Text("Wins on Medium: \(user.mediumWins)")
                    Text("Wins on Hard: \(user.hardWins)")
                    Text("Total: \(user.totalWins)")
                    Text("Win Rate: \(user.winRatio, specifier: "%.1f")")
                    Text("Highest score \(user.highestScore.description)")
                }
                .font(.system(size: 25))
                ScrollView {
//                    AchievementView(user: user.self)
                }
            }
            .padding(.top, 180)
            .modifier(CenterToolBarTitle(text: "Game History"))
    }
}

struct GameHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        GameHistoryView(user: .init(id: 1, name: "Mac", gamesPlayed: 9, easyWins: 5, mediumWins: 3, hardWins: 1, totalWins: 9, winRatio: 0.9, currentScore: 0, highestScore: 200))
    }
}
