//
//  DifficultyDetailsView.swift
//  Memory Game
//
//  Created by Binh Ngo on 19/08/2023.
//

import SwiftUI

struct DifficultyDetailsView: View {
    @EnvironmentObject var selectedDifficulty: Difficulty
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(colorScheme == .dark ? Color.primary : Color.secondary)
            .frame(height: 200)
            .overlay(
                GeometryReader { geometry in
                    ScrollView(.vertical) {
                        VStack() {
                            switch selectedDifficulty.currentDifficulty {
                            case "Easy":
                                VStack(alignment: .center) {
                                    Text("Easy Difficulty Selected")
                                    Text("Time Limit +20s")
                                    Text("Score Modifier x0.9")
                                }
                                
                            case "Medium":
                                VStack(alignment: .center) {
                                    Text("Medium Diffiulty Selected")
                                    Text("Base time limit")
                                    Text("Score Modifier x1.0")
                                }
                                
                            case "Hard":
                                VStack(alignment: .center) {
                                    Text("Hard Difficulty Selected")
                                    Text("Time Limit -30s")
                                    Text("Score Modifier x1.2")
                                }
                                
                            default:
                                Text("Please select a difficulty")
                            }
                        }
                        .padding()
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                    }
                }
            )
            .padding()
    }
}

struct DifficultyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyDetailsView().environmentObject(Difficulty()) 
    }
}
