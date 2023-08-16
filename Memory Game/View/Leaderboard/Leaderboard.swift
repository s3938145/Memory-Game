//
//  Leaderboard.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

import SwiftUI

struct Leaderboard: View {
    
    var sortedScore : [Score] {
        return scores.sorted(by: {$0.points > $1.points})
    }
    
    var body: some View {
        
        NavigationView {
            List(sortedScore) {score in
                LeaderboardRow(score: score)
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
