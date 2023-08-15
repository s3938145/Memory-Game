//
//  ContentView.swift
//  Memory Game
//
//  Created by Binh Ngo Chi on 15/08/2023.
//

import SwiftUI

struct MenuButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 69)
            .background(Color(red: 0, green: 0.5, blue: 0.5).opacity(0.7))
            .foregroundStyle(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ContentView: View {
    @State var theColorScheme: ColorScheme = .dark
    @Environment(\.colorScheme) var colorScheme
    
    func toggleColorScheme() {
        theColorScheme = (theColorScheme == .dark) ? .light : .dark
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Image("poker-cards")
                    .resizable()
                    .frame(width: 350, height: 350)
                
                VStack(spacing: 60) {

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
                    
                    Text("Memory Match")
                        .font(.system(size: 50, weight: .bold))
                        .italic()
                        .frame(maxWidth: .infinity)
                        .background(Color(.gray).opacity(0.7))
                
                    NavigationLink(destination: Text("Game View")) {
                        Text("Play")
                            .font(.system(size: 35))
                    }
                    .buttonStyle(MenuButton())
                    
                    NavigationLink(destination: Text("Highscore View")) {
                        Text("Leaderboard")
                            .font(.system(size: 35))
                    }
                    .buttonStyle(MenuButton())
                    
                    NavigationLink(destination: Text("How To")) {
                        Text("How To")
                            .font(.system(size: 35))
                    }
                    .buttonStyle(MenuButton())
                    
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
