//
//  GameView.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//
//1. https://codewithchris.com/first-swiftui-app-tutorial/

import SwiftUI

struct GameView: View {
    var currentUser: User
    @ObservedObject var gameVM: GameViewModel
    
    @State var difficultyText: String = ""
    @State private var playerWins: Bool = false
    @State var gameOver: Bool = false
    @State var finalScore: Int = 0
    
    init(currentUser: User, gameViewModel: GameViewModel) {
        self.currentUser = currentUser
        self.gameVM = gameViewModel
    }
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                Image("logo")
                Text("Difficulty: \(difficultyText)")
                Spacer()
                
                HStack {
                    Image("card" +  String(gameVM.playerCard))
                    Image("card" + String(gameVM.cpuCard))
                }
                
                Spacer()
                
                Button(action: {
                    gameVM.dealCards()
                    
                    gameVM.compareCard()
                    
                    gameOver = gameVM.gameOver
                    finalScore = gameVM.finalScore
                    playerWins = gameVM.playerWins
                    
                }, label: {
                    Image("dealbutton")
                        .renderingMode(.original)
                })
                .simultaneousGesture(TapGesture().onEnded{
                    playSound(sound: "cardFlip", type: "wav")
                })
                
                Spacer()
               
                HStack{
                    VStack {
                        Text("\(currentUser.name)")
                        Text("\(gameVM.playerScore)")
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                        Text("\(gameVM.cpuScore)")
                    }
                }
                .padding(.horizontal, 30)
                .foregroundColor(.primary)
                
                Spacer()
            }
            GameOver(gameOver: $gameOver,finalScore: $finalScore,playerWins: $playerWins, difficultyText: $difficultyText, currentUser: currentUser)
        }
        .onAppear() {
            difficultyText = gameVM.getDifficulty()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(currentUser: .init(id: 1, name: "Will", gamesPlayed: 0, easyWins: 0, mediumWins: 0, hardWins: 0, totalWins: 0, winRatio: 0, currentScore: 0, highestScore: 0), gameViewModel: GameViewModel(difficulty: Difficulty.easy))
    }
}
