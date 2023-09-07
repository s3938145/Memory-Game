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

struct MenuButtons: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 35))
            .frame(width: 300, height: 69)
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(configuration.isPressed ? Color(red: 0, green: 1.2, blue: 0.5).opacity(0.7) : Color(red: 0, green: 0.5, blue: 0.5).opacity(0.7))
            .foregroundStyle(.primary))
    }
}

struct SubMenuButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .frame(width: 200, height: 60)
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(configuration.isPressed ? Color(red: 0, green: 1.2, blue: 0.5).opacity(0.7) : Color(red: 0, green: 0.5, blue: 0.5).opacity(0.7))
            .foregroundStyle(.primary))
    }
}

struct DifficultyButtonStyle: ButtonStyle {
    @Binding var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 35))
            .frame(width: 300, height: 69)
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(self.isSelected ? Color(red: 0, green: 1.2, blue: 0.5).opacity(0.7) : Color(red: 0, green: 0.5, blue: 0.5).opacity(0.7))
            .foregroundStyle(.primary))
    }
}

