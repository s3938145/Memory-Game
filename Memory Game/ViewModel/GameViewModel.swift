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

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published var playerScore: Int = 0
    @Published var cpuScore: Int = 0
    
    @Published var playerCard: Int = 2
    @Published var cpuCard : Int = 2
    
    @Published var finalScore: Int = 0
    
    @Published var difficulty: Difficulty
    @Published var gameOver: Bool = false
    @Published var playerWins: Bool = false
    
    var scoreLimit: Int {
        Int(difficulty.rawValue)
    }
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    
    func getDifficulty() -> String {
        switch self.difficulty {
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }
    
    func dealCards() {
        self.playerCard = Int.random(in: 2...14)
        switch self.difficulty {
        case .easy:
            self.cpuCard = Int.random(in: 2...10)
            break
        case .medium:
            self.cpuCard = Int.random(in: 2...12)
            break
        case .hard:
            self.cpuCard = Int.random(in: 2...14)
        }
    }
    
    func compareCard() {
        if self.playerCard > self.cpuCard {
            self.playerScore += 1
        } else if self.playerCard < self.cpuCard {
            self.cpuScore += 1
        }
        checkGameOver()
    }
    
    func checkGameOver() {
        if self.playerScore >= scoreLimit || self.cpuScore >= scoreLimit {
            if self.playerScore >= scoreLimit {
                self.playerWins = true
                self.finalScore = self.playerScore
            }
            gameOver = true
            resetGame()
        } else {
            gameOver = false
        }
    }
    
    
    func resetGame() {
        self.playerScore = 0
        self.cpuScore = 0
        self.playerCard = 2
        self.cpuCard = 2
    }
    
}
