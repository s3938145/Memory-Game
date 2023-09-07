//
//  DifficultySelection.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//

import SwiftUI

struct DifficultySelection: View {
    @EnvironmentObject var userSettings: Settings
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Select Difficulty")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            VStack(spacing: 10) {
                ForEach(Difficulty.allCases, id: \.self) { level in
                    Button(action: {
                        userSettings.difficulty = level
                    }, label: {
                        Text(level.description)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    .simultaneousGesture(TapGesture().onEnded{
                        playSound(sound: "click", type: "wav")
                    })
                }
            }
            .onAppear() {
                MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "Ceremonial")
            }
            .onDisappear() {
                MusicPlayer.shared.stopBackgroundMusic()
            }
        }
        .padding()
    }
}

struct DifficultySelection_Previews: PreviewProvider {
    static var previews: some View {
        DifficultySelection().environmentObject(Settings())
    }
}
