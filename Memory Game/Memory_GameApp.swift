//
//  Memory_GameApp.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

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
