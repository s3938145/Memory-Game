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

@main
struct Memory_GameApp: App {
    @StateObject private var userSettings = Settings()
    
    var body: some Scene {
        WindowGroup {
            if let difficulty = userSettings.difficulty {
                ContentView().environmentObject(userSettings)
            } else {
                DifficultySelection().environmentObject(userSettings)
            }
        }
    }
}
