//
//  Player.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/12/24.
//

import Foundation

struct Player: Codable, Identifiable, Hashable {
    var id = UUID()
    var name: String
    var points: [Double]
    
}
