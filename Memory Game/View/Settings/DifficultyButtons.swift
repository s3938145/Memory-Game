//
//  DifficultyButtons.swift
//  Memory Game
//
//  Created by Binh Ngo on 19/08/2023.
//

import SwiftUI

struct DifficultyButtons: View {
    @State var selected = false
    @Binding var difficulty: String
    @EnvironmentObject var selectedDifficulty: Difficulty

    var body: some View {
        Button {
            selectedDifficulty.currentDifficulty = difficulty
        } label: {
            Text(difficulty)
        }.buttonStyle(DifficultyButtonStyle(isSelected: $selected))
    }
}

struct DifficultyButtons_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyButtons(difficulty: .constant("Easy")).environmentObject(Difficulty()) 
    }
}
