//
//  Leaderboard.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

import SwiftUI

struct Leaderboard: View {
    
    var sortedUsers : [User] {
        return users.sorted(by: {$0.highestScore > $1.highestScore})
    }
    
    var body: some View {
        
        NavigationView {
            List(sortedUsers) {user in
                NavigationLink {
                    GameHistoryView(user: user)
                } label: {
                    LeaderboardRow(user: user)
                }
            }
            .modifier(CenterToolBarTitle())
        }
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}
