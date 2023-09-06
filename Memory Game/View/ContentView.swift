//
//  ContentView.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

import SwiftUI

class Difficulty: ObservableObject {
    @Published var currentDifficulty = "Easy"
}

struct ContentView: View {
    @State var theColorScheme: ColorScheme = .dark
    @Environment(\.colorScheme) var colorScheme
    
    func toggleColorScheme() {
        theColorScheme = (theColorScheme == .dark) ? .light : .dark
    }
    
    var body: some View {
        NavigationView {
            
            //MARK: - App Icon
            ZStack {
                Image("poker-cards")
                    .resizable()
                    .frame(width: 350, height: 350)
                
                //MARK: - Main Menu
                VStack(spacing: 60) {
                    //MARK: - Dark Mode Toggle
                    HStack {
                        Button(action: self.toggleColorScheme) {
                            if(theColorScheme == .light) {
                                Text("Light")
                                    .font(.system(size: 25))
                                    .padding(5)
                                    .background(Color.primary.cornerRadius(10.0))
                            } else {
                                Text("Dark")
                                    .font(.system(size: 25))
                                    .padding(5)
                                    .background(Color.primary.cornerRadius(10.0))
                            }
                        }
                        .preferredColorScheme(theColorScheme)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 60)
                    
                    //MARK: - App Name
                    Text("Memory Match")
                        .font(.system(size: 50, weight: .bold))
                        .italic()
                        .frame(maxWidth: .infinity)
                        .background(Color(.gray).opacity(0.7))
                
                    //MARK: - Play Button
                    NavigationLink(destination: SwitchUser()) {
                        Text("Play")
                    }
                    .buttonStyle(MenuButtons())
                    
                    //MARK: - Leaderboard Button
                    NavigationLink(destination: Leaderboard()) {
                        Text("Leaderboard")
                    }
                    .buttonStyle(MenuButtons())
                    
                    //MARK: - How To Play Button
                    NavigationLink(destination: Text("How To")) {
                        Text("How To")
                    }
                    .buttonStyle(MenuButtons())
                    
                    //MARK: - Settings Button
                    NavigationLink(destination: SettingsView().environmentObject(Difficulty())) {
                        Text("Settings")
                    }
                    .buttonStyle(MenuButtons())
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
