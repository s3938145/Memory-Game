//
//  MainView.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import SwiftUI

struct MainView: View {
    @State var count: Int = 0
    var body: some View {
        VStack {
            ChildView(counter: $count).frame(width: 200, height: 50)
            Text("Tapped \(count) times").foregroundColor(.red)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
