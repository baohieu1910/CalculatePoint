//
//  Player.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/12/24.
//

import Foundation

struct Player: Codable, Identifiable, Hashable, Equatable {
    var id = UUID()
    var name: String
    var points: [Int]
    var recentPoint: Int?
}

// Public functions
extension Player {
    func totalPoint() -> Int {
        return points.reduce(0, +)
    }
}

// Private functions
private extension Player {
    
}
