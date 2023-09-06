//
//  AchievementRow.swift
//  Memory Game
//
//  Created by Will Ngo on 2023-08-17.
//

import SwiftUI

//struct AchievementRow: View {
//    
//    @State var showingInfo = false
//    var achievement: Achievement
//    
//    var body: some View {
//        
//        Button {
//            showingInfo = true
//        } label: {
//            HStack(alignment: .center){
//                Image(achievement.image)
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .opacity(achievement.achieved == true ? 1: 0.4)
//                VStack(alignment: .leading) {
//                    Text(achievement.name)
//                        .font(.title2)
//                    Text(achievement.description)
//                }
//            }
//            .padding(9)
//            .frame(maxWidth: .infinity, maxHeight: 80)
//            .background(achievement.achieved == true ? Color.green: Color.gray.opacity(0.4)).cornerRadius(20)
//            .foregroundColor(achievement.achieved == true ? Color.primary: Color.primary.opacity(0.4))
//        }.alert(isPresented: $showingInfo) {
//            Alert(title: Text("How to get this Achievement"), message: Text(achievement.description))
//        }
//    }
//}
//
//struct AchievementRow_Previews: PreviewProvider {
//    static var previews: some View {
//        AchievementRow(achievement: achievements[1])
//    }
//}
