//
//  ToolBarModifier.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-16.
//

import Foundation
import SwiftUI


struct CenterToolBarTitle: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text(text)
                            .font(.system(size: 40))
                            .padding()
                    }
                }
            }
    }
}

