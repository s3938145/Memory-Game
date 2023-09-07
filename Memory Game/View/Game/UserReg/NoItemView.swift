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

struct NoItemView: View {
    
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text("No user")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Create a new user in order to record your game history, achievements and highscore. Your name and highscore will be recorded on the leaderboard")
                    
                }
                .multilineTextAlignment(.center)
                .padding(40)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar {
                    Toggle("Add User", isOn: $show)
                        .toggleStyle(.button)
                        .tint(.green)
                }
            AddUser(show: $show)
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .modifier(CenterToolBarTitle(text: "Title"))
        }
    }
}
