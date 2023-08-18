//
//  ReadUser.swift
//  Memory Game
//
//  Created by Binh Ngo on 17/08/2023.
//

import Foundation

var users = decodeUserJson(jsonFileName: "users.json")

func decodeUserJson(jsonFileName: String) -> [User] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([User].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [User]
}
