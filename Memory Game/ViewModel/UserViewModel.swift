//
//  UserViewModel.swift
//  Memory Game
//
//  Created by Binh Ngo on 05/09/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users = [User](){
        didSet {
            saveUserData()
        }
    }
    let userDataKey: String = "userData"
    
    init() {
        loadUserData()
    }
    
    func addUser(name:String) {
        let user = User(id: users.count + 1, name: name, gamesPlayed: 0, easyWins: 0, mediumWins: 0, hardWins: 0, totalWins: 0, winRatio: 0, currentScore: 0, highestScore: 0)
        users.append(user)
    }
    
    func deleteUser(at indexSet:IndexSet) {
        users.remove(atOffsets: indexSet)
    }
    
    func updateEasyWins(user: User) {
        if let i = users.firstIndex(where: {$0.id == user.id}) {
            users[i].easyWins += 1
            updateWins(index: i)
        } else {
            return
        }
    }
    
    func updateMediumWins(user: User) {
        if let i = users.firstIndex(where: {$0.id == user.id}) {
            users[i].mediumWins += 1
            updateWins(index: i)
        }
    }
    
    func updateHardWins(user: User) {
        if let i = users.firstIndex(where: {$0.id == user.id}) {
            users[i].hardWins += 1
            updateWins(index: i)
        }
    }
    
    func updateLosses(user: User) {
        if let i = users.firstIndex(where: {$0.id == user.id}) {
            users[i].gamesPlayed += 1
            users[i].winRatio = Double(Double(users[i].totalWins) / Double(users[i].gamesPlayed))
        }
    }
    
    func updateWins(index: Int) {
        users[index].gamesPlayed += 1
        users[index].totalWins = users[index].easyWins + users[index].mediumWins + users[index].hardWins
        users[index].winRatio = Double(Double(users[index].totalWins) / Double(users[index].gamesPlayed))
    }
    
    func updateCurrentScore(user: User, score: Int) {
        if let i = users.firstIndex(where: {$0.id == user.id}) {
            users[i].currentScore = score
        }
        updateHighScore(user: user)
    }
    
    func updateHighScore(user: User) {
        if let i = users.firstIndex(where: {$0.id == user.id}) {
            if (users[i].currentScore > users[i].highestScore) {
                users[i].highestScore = users[i].currentScore
            }
        }
    }
    
    
    func saveUserData() {
        let endcoder = JSONEncoder()
        if let userJSONData = try? endcoder.encode(users) {
            UserDefaults.standard.set(userJSONData, forKey: userDataKey)
        } else {
            return
        }
    }
    
    func loadUserData() {
        guard
            let data = UserDefaults.standard.data(forKey: userDataKey),
            let decoded = try? JSONDecoder().decode([User].self, from: data)
        else {
            return
        }
        self.users = decoded
    }
}

