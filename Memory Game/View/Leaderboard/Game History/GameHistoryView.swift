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

struct GameHistoryView: View {
    
    @StateObject var userVM = UserViewModel()
    
    @State var user: User
    
    var body: some View {
        VStack {
                Section {
                    Text("Username: \(user.name)")
                    Text("Games Played: \(user.gamesPlayed.description)")
                    Text("Wins on Easy: \(user.easyWins)")
                    Text("Wins on Medium: \(user.mediumWins)")
                    Text("Wins on Hard: \(user.hardWins)")
                    Text("Total: \(user.totalWins)")
                    Text("Win Rate: \(user.winRatio, specifier: "%.1f")")
                    Text("Highest score \(user.highestScore.description)")
                }
                .font(.system(size: 25))
                ScrollView {
                    AchievementView(user: user.self)
                }
            }
            .padding(.top, 180)
            .modifier(CenterToolBarTitle(text: "Game History"))
    }
}

struct GameHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        GameHistoryView(user: .init(id: 1, name: "Mac", gamesPlayed: 9, easyWins: 5, mediumWins: 3, hardWins: 1, totalWins: 9, winRatio: 0.9, currentScore: 0, highestScore: 200))
    }
}
