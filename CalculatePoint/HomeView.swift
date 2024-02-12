//
//  HomeView.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/12/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: PlayersViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    ForEach(viewModel.players) { player in
                        HStack {
                            Text("\(player.id)")
                            
                            Spacer()
                            
                            Text("\(player.name)")
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Calculate Point")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addPlayer()
                    } label: {
                        Text("Add")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.removeAllPlayers()
                    } label: {
                        Text("Reset")
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: PlayersViewModel())
    }
}
