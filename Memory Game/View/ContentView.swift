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
                    Text("Card Wars")
                        .font(.system(size: 50, weight: .bold))
                        .italic()
                        .frame(maxWidth: .infinity)
                        .background(Color(.gray).opacity(0.7))
                
                    //MARK: - Play Button
                    NavigationLink(destination: SwitchUser()) {
                        Text("Play")
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        playSound(sound: "click", type: "wav")
                    })
                    .buttonStyle(MenuButtons())
                    
                    //MARK: - Leaderboard Button
                    NavigationLink(destination: Leaderboard()) {
                        Text("Leaderboard")
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        playSound(sound: "click", type: "wav")
                    })
                    .buttonStyle(MenuButtons())
                    
                    //MARK: - Settings Button
                    NavigationLink(destination: DifficultySelection().environmentObject(Settings())) {
                        Text("Setting")
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        playSound(sound: "click", type: "wav")
                    })
                    .buttonStyle(MenuButtons())
                    
                    //MARK: - Settings Button
                    NavigationLink(destination: HowToView()) {
                        Text("How To Play")
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        playSound(sound: "click", type: "wav")
                    })
                    .buttonStyle(MenuButtons())
                    
                    Spacer()
                }
                .onAppear() {
                    MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "Snowfall")
                }
                .onDisappear() {
                    MusicPlayer.shared.stopBackgroundMusic()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
