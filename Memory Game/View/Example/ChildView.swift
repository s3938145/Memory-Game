//
//  ChildView.swift
//  Memory Game
//
//  Created by Binh Ngo on 17/08/2023.
//

import SwiftUI

struct ChildView: View {
    @Binding var counter: Int
    var body: some View {
        ZStack {
            Color.green
            Text("Click Me").onTapGesture {
                counter += 1
            }
        }
    }
}

