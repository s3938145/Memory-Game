//
//  MainTextModifer.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.primary)
            .font(.system(.title3, design: .rounded))
    }
}
