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

struct SwitchUser: View {
    
    @State private var name: String = ""
    @State var show: Bool = false
    @StateObject private var userVM = UserViewModel()
    @StateObject private var userSettings = Settings()
    
    var body: some View {
        ZStack {
            if (userVM.users.isEmpty) {
                ZStack {
                    NoItemView()
                }
            } else {
                ZStack {
                    List(self.userVM.users.sorted(by: {$0.name < $1.name})) {user in
                        NavigationLink{
                            if let difficulty = userSettings.difficulty {
                                GameView(currentUser: user, gameViewModel: GameViewModel(difficulty: difficulty)).environmentObject(userSettings)
                            }
                               
                        } label: {
                            LeaderboardRow(user: user)
                        }
                    }
                    AddUser(show: $show)
                }
                .modifier(CenterToolBarTitle(text: "User"))
                .toolbar {
                    Toggle("Add User", isOn: $show)
                        .toggleStyle(.button)
                        .tint(.green)
                }

            }
        }
    }
}

struct SwitchUser_Previews: PreviewProvider {
    static var previews: some View {
        SwitchUser()
    }
}
