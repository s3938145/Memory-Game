//
//  MenuButtons.swift
//  Memory Game
//
//  Created by Binh Ngo on 19/08/2023.
//

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

