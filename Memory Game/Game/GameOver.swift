//
//  GameOver.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//

import SwiftUI

struct GameOver: View {
    
    @StateObject private var userVM = UserViewModel()
    
    @Binding var gameOver: Bool
    @Binding var finalScore: Int
    @Binding var playerWins: Bool
    @Binding var difficultyText: String
    
    var currentUser: User
    
    @State private var GameOverText: String = ""
    
    var body: some View {
        
        if gameOver {
            ZStack {
                Color.gray.opacity(gameOver ? 0.9 : 0.9).edgesIgnoringSafeArea(.all)
                ZStack {
                    VStack(spacing: 10) {
                        Text("\(GameOverText)")
                            .font(.title)
                        VStack {
                            Text("\(currentUser.name)")
                            Text("Difficulty: \(difficultyText)")
                            Text("Final Score: \(finalScore)")
                        }
                        
                        NavigationLink(destination: ContentView()) {
                            Text("Main Menu")
                        }
                        .buttonStyle(SubMenuButton())
                        .simultaneousGesture(TapGesture().onEnded{
                            playSound(sound: "click", type: "wav")
                        })
                    }
                }
                .onAppear() {
                    if playerWins {
                        GameOverText = "Congratulation"
                        playSound(sound: "victory", type: "wav")
                        userVM.updateCurrentScore(user: currentUser, score: finalScore)
                        // Update user's stats when won
                        switch self.difficultyText {
                        case "Easy":
                            userVM.updateEasyWins(user: currentUser)
                        case "Medium":
                            userVM.updateMediumWins(user: currentUser)
                        case "Hard":
                            userVM.updateHardWins(user: currentUser)
                        default:
                            return
                        }
                    } else {
                        GameOverText = "You lost"
                        playSound(sound: "defeat", type: "mp3")
                        // Update User's stats when lost
                        userVM.updateLosses(user: currentUser)
                    }
                }
            }
            .frame(width: 350, height: 250)
            .cornerRadius(20)
        }
    }
}

struct GameOver_Previews: PreviewProvider {
    static var previews: some View {
        GameOver(gameOver: .constant(true), finalScore: .constant(10),playerWins: .constant(true), difficultyText: .constant("Easy") ,currentUser: .init(id: 1, name: "Will", gamesPlayed: 0, easyWins: 0, mediumWins: 0, hardWins: 0, totalWins: 0, winRatio: 0, currentScore: 0, highestScore: 0))
    }
}
