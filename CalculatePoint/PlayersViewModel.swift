//
//  PlayersViewModel.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/12/24.
//

import Foundation
import SwiftUI

class PlayersViewModel: ObservableObject {
    @Published var players: [Player] = []
    
    init() {
        load()
    }
    
}

// Public functions
extension PlayersViewModel {
    func addPlayer(newPlayer: Player) {
        players.append(newPlayer)
        save()
    }
    
    func removeAllPlayers() {
        players = []
        save()
        
    }
    
    func gameCount() -> Int {
        var max: Int = 0
        
        for player in players {
            if max < player.points.count {
                max = player.points.count
            }
        }
        
        return max
    }
    
    func addPoints(to player: Player, point: Int) {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            players[index].points.append(point)
        }
        save()
    }
    
    func nameWidth() -> CGFloat {
        var max: Int = 0
        
        for player in players {
            if max < player.name.count {
                max = player.name.count
            }
        }
        return CGFloat(max * 10)
    }
    
    func sortPoints(isAscending: Bool) {
        if isAscending {
            players = players.sorted { lhs, rhs in
                lhs.totalPoint() < rhs.totalPoint()
            }
        } else {
            players = players.sorted { lhs, rhs in
                lhs.totalPoint() > rhs.totalPoint()
            }
        }
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(players) else {
            return
        }
        UserDefaults.standard.set(data, forKey: "Players")
    }
    
    func load() {
        guard let data = UserDefaults.standard.object(forKey: "Players") as? Data else {
            return
        }
        self.players = try! JSONDecoder().decode([Player].self, from: data)
    }
}

// Private functions
private extension PlayersViewModel {
    
}
