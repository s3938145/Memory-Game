//
//  SettingsView.swift
//  Memory Game
//
//  Created by Binh Ngo on 19/08/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var selectedDifficulty: Difficulty
    var difficulties = ["Easy", "Medium", "Hard"]

    var body: some View {
        VStack(spacing: 40) {
            Text("Current Difficulty: \(selectedDifficulty.currentDifficulty)")
                .font(.system(size: 25))
                .padding(.all, 6)
                .frame(width: 300)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.green, lineWidth: 3))
            ForEach(difficulties, id:\.self) {difficulty in
                DifficultyButtons(difficulty: .constant(difficulty))
            }
            DifficultyDetailsView(selectedDifficulty: _selectedDifficulty)
        }
        .modifier(CenterToolBarTitle(text: "Difficulty"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(Difficulty()) 
    }
}
