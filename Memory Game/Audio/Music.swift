//
//  Music.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//
// https://www.hackingwithswift.com/forums/swiftui/playing-sound/4921
// https://stackoverflow.com/questions/59404039/how-to-play-audio-using-avaudioplayer-in-swiftui-project

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

//Function to play a music for one time
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error")
        }
    }
}
