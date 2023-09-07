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

struct Leaderboard: View {
    
    @StateObject var userVM = UserViewModel()
    
    var sortedUsers : [User] {
        return userVM.users.sorted(by: {$0.highestScore > $1.highestScore})
    }
    
    var body: some View {
        List(sortedUsers) {user in
            NavigationLink {
                GameHistoryView(user: user)
            } label: {
                LeaderboardRow(user: user)
            }
        }
        .modifier(CenterToolBarTitle(text: "Leaderboard"))
        .onAppear() {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "Dreamland")
        }
        .onDisappear() {
            MusicPlayer.shared.stopBackgroundMusic()
        }
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}
