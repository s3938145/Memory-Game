//
//  SwitchUser.swift
//  Memory Game
//
//  Created by Binh Ngo on 05/09/2023.
//

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
