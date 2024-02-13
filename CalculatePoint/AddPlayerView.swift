//
//  AddPlayerView.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/12/24.
//

import SwiftUI

struct AddPlayerView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: PlayersViewModel
    @State var name: String = ""
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $name)
            }
            HStack {
                Spacer()
                
                Button {
                    let points = Array(repeating: 0, count: viewModel.gameCount())
                    let newPlayer = Player(name: name, points: points)
                    viewModel.addPlayer(newPlayer: newPlayer)
                    dismiss()
                } label: {
                    Text("Save")
                }
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            }
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView(viewModel: PlayersViewModel())
    }
}
