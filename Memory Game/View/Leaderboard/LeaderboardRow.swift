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
            LeaderboardRow(user: .init(id: 1, name: "Mac", gamesPlayed: 10, easyWins: 5, mediumWins: 3, hardWins: 1, totalWins: 9, winRatio: 0.9,currentScore: 0, highestScore: 200))
                .previewLayout(.fixed(width: 200, height: 80))
            LeaderboardRow(user: .init(id: 2, name: "Jill", gamesPlayed: 10, easyWins: 5, mediumWins: 1, hardWins: 1, totalWins: 7, winRatio: 0.7, currentScore: 0, highestScore: 130))
                .previewLayout(.fixed(width: 200, height: 80))
        }
    }
}
