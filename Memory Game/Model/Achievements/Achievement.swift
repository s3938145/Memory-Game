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

import Foundation

struct Achievement: Identifiable, Codable, Hashable {
    let id: Int
    let image, name, description: String
    var achieved: Bool
}
