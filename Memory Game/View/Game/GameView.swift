//
//  GameView.swift
//  Memory Game
//
//  Created by Binh Ngo on 05/09/2023.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var userVM = UserViewModel()
    @ObservedObject var memoryGame: GameViewModel
    
    @State var currentUser: User
    @State var show = false
    @State var gameMode: Int
    @State var buttonClickCheck: Bool
    
    var body: some View {
        ZStack {
            Color("Purple")
                .ignoresSafeArea()
            VStack {
                //Information at the top of the screen
                HStack {
                    Text("Welcome: \(currentUser.name)")
                        .modifier(TextModifier())
                    Spacer()
                    Text("Score: \(memoryGame.getScore())")
                        .modifier(TextModifier())
                }
                
                //Show game body
                gameBody
                Spacer()
                
                //Show two button at the bottom of the screen
                HStack{
                    shuffle
                    restart
                }
                .padding(.horizontal)
            }
            .padding(20)
            .foregroundColor(Color("Card"))
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text(""), displayMode: .inline)
            
            EndView(check: memoryGame.getCheck(), gameMode: gameMode, score: memoryGame.getScore())
            //Play a sound when this view appear
                .onAppear {
                    userVM.updateCurrentScore(user: currentUser, score: memoryGame.getScore())
                    playSound(sound: "level-win", type: "mp3")
                }
        }
        
        //Play and stop background sound on appear and on dissapear
        .onAppear {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "game")
        }
        .onDisappear {
            MusicPlayer.shared.stopBackgroundMusic()
        }
        
        
    }
    
    //Game body view here
    var gameBody: some View {
        Grid(items: memoryGame.cards, aspectRatio: 2/3, content: {
            card in
            !card.isFaceUp && card.isMatched ?  AnyView(rec(game: memoryGame)) : AnyView(checkMatch(card: card, game: memoryGame))
        })
    }
    
    //If is two cards matched, hide this card
    func rec(game: GameViewModel) -> some View {
        Rectangle().opacity(0.0)
            .onAppear {
                userVM.updateCurrentScore(user:currentUser, score:game.getScore())
                print(game.getScore())
            }
    }
    
    //function to render the cards
    func checkMatch(card: CardModel.Card, game: GameViewModel) -> some View{
        CardView(card: card)
            .transition(AnyTransition.scale)
            .onTapGesture {
                print(game.getScore())
                withAnimation {
                    memoryGame.choose(card)
                }
            }
    }
    
    //Shuffle button here
    var shuffle: some View {
        Button {
            withAnimation {
                memoryGame.shuffle()
            }
        } label: {
            Text("Shuffle")
                .foregroundColor(Color("White"))
        }
        .modifier(FunctionButton(color: Color("Green")))
        
    }
    
    //Restart button here and reset user score
    var restart: some View {
        Button {
            withAnimation {
                memoryGame.restart()
                userVM.updateCurrentScore(user: currentUser, score: 0)
            }
        }  label: {
            Text("Restart")
                .foregroundColor(Color("White"))
        }
        .modifier(FunctionButton(color: Color("Red")))
    }
}
