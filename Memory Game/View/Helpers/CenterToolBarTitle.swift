//
//  ToolBarModifier.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-16.
//

import Foundation
import SwiftUI

struct CenterToolBarTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Highscore")
                            .font(.system(size: 40))
                            .padding(.top, 20)
                            .padding(.bottom, 5)
                    }
                }
            }
    }
}

struct CenterToolBarTitleAchievement: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Achievements")
                            .font(.system(size: 40))
                            .padding(.top, 20)
                    }
                }
            }
    }
}

struct CenterBarTitleHistory: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Game History")
                            .font(.system(size: 40))
                            .padding(.top, 20)
                    }
                }
            }
    }
}
