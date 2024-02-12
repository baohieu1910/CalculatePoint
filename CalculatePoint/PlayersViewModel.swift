//
//  PlayersViewModel.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/12/24.
//

import Foundation

class PlayersViewModel: ObservableObject {
    @Published var players: [Player] = [] {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
}

// Public functions
extension PlayersViewModel {
    func addPlayer() {
        let newPlayer = Player(name: "Bao Hieu", points: [5, -5])
        players.append(newPlayer)
        
    }
    
    func removeAllPlayers() {
        players = []
        
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
