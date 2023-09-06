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

struct GameButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150)
            .background(Color(.red))
            .foregroundColor(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.green), lineWidth: 5)
            )
            .padding(5)
    }
}

struct FunctionButton: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150)
            .background(color)
            .foregroundColor(.primary)
            .cornerRadius(10)
    }
}
