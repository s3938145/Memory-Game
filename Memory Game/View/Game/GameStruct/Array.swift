//
//  Array.swift
//  Memory Game
//
//  Created by Binh Ngo on 06/09/2023.
//

import SwiftUI

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {    // return value is an Optional
        for index in 0 ..< self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
