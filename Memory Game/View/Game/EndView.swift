//
//  EndView.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//

import SwiftUI

//Win view to check whenever user have matched all cards
struct EndView: View {
    var check: Int
    var gameMode: Int
    var score: Int
    
    var body: some View {
        if gameMode == check {
            ZStack {
                Color.black.opacity(gameMode == check ? 0.9 : 0).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Green")
                    ZStack {
                        Image("Win")
                            .opacity(0.7)
                        VStack{
                            Text("You win")
                                .font(.system(.largeTitle, design: .rounded))
                                .fontWeight(.bold)
                            Text("Your score: \(self.score)")
                        }
                        .padding()
                    }
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            }
        }
    }
}
