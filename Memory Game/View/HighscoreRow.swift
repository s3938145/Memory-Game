//
//  HighscoreRow.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

import SwiftUI

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

struct HighscoreRow: View {
    var body: some View {
        HStack {
            Text(highscores[0].name)
            Spacer()
            Text(highscores[0].score.description)
        }
    }
}

struct HighscoreRow_Previews: PreviewProvider {
    static var previews: some View {
        HighscoreRow()
    }
}