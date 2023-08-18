//
//  LeaderboardRow.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-16.
//

import SwiftUI

struct LeaderboardRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    var user: User
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 10){
            Spacer()
            Text(user.name)
            Text("---")
            Text("\(user.highestScore.description) pt")
            Spacer()
        }
        .padding()
        .font(.system(size: 25, weight: .bold))
        .italic()
        .background(colorScheme == .dark ? Color(UIColor.darkGray) : Color(UIColor.lightGray)).cornerRadius(15)
    }
}

struct LeaderboardRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LeaderboardRow(user: users[0])
                .previewLayout(.fixed(width: 200, height: 80))
            LeaderboardRow(user: users[1])
                .previewLayout(.fixed(width: 200, height: 80))
        }
    }
}
