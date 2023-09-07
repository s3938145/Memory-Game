//
//  HowToView.swift
//  Memory Game
//
//  Created by Binh Ngo on 19/08/2023.
//

import SwiftUI

struct HowToView: View {
    var body: some View {
        List{
            Section{
                Text("  Card War is a simple game designed as a simple time killer, as well as an outlet for those that want to satisfy a gambling craving.")
                Text("  Card War is a single player game with a one objective: see how lucky you're are. Both the Player and the Cpu opponent will be randomly assigned a card every time the 'Deal' button is pushed. If the Player's card have a larger value than the Cpu's card, a point is given to the Player, and vice versa. The side that reach the maximum point first is the winner")
            } header: {
                Text("Introduction")
            }
            .headerProminence(.increased)
            
            //Game mode for this application
            Section {
                Text("""
                    Easy mode:
                    
                        The card with the highest value in the Cpu's deck is 10 vs the Player's 14. The maximum point is 10
                    """)
                Text("""
                    Medium mode:
                    
                        The card with the highest value in the Cpu's deck is 12 vs the Player's 14. The maximum point is 25
                    """)
                Text("""
                    Hard mode:
                    
                        The card with the highest value in the Cpu's deck is 14 vs the Player's 14. The maximum point is 40
                    """)
            } header: {
                Text("Difficulty")
            } footer: {
                Text("""
                     Select a difficulty before playing the game, different mode will have different scoring method and a different number of cards for the opponent.
                     """)
            }
            .headerProminence(.increased)
            
            //Leaderboard instruction
            Section {
                Text("All scores will be displayed on the leaderboard with the respective player’s name.")
            } header: {
                Text("Leaderboard score")
            } footer: {
                Text("Selecting a name in the leaderboard will also display that player's game history")
            }
            .headerProminence(.increased)
        }
        .navigationTitle("How to play")
        //Play background music on appear
        .onAppear() {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "Allegro")
        }
        .onDisappear() {
            MusicPlayer.shared.stopBackgroundMusic()
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}
