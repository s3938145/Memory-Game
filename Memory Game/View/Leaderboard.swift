//
//  Leaderboard.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

import SwiftUI

struct Leaderboard: View {
    
    struct Scores: Identifiable {
        let id = UUID()
        let name: String
        let score: Int
    }
    
    private var highscores = [
        Scores(name: "Will", score: 200),
        Scores(name: "Will", score: 190),
        Scores(name: "Holl", score: 180)
    ]
    
    var body: some View {
        NavigationView {
            List (highscores){
                Text ("\($0.name) -- \($0.score)")
            }.navigationTitle("Highscores")
        }
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}
