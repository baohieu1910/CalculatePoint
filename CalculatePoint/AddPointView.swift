//
//  AddPointView.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/13/24.
//

import SwiftUI


//struct AddPointsView: View {
//    @ObservedObject var viewModel: PlayersViewModel
//
//    var body: some View {
//        VStack {
//            ScrollView {
//                ForEach(viewModel.players, id: \.id) { player in
//                    AddPointView(player: player, viewModel: viewModel)
//                }
//            }
//        }
//    }
//}
struct AddPointsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: PlayersViewModel
    @State var userInput: [String]
    
    var body: some View {
            Form {
                ForEach(viewModel.players.indices, id: \.self) { index in
                    HStack {
                        Text("\(viewModel.players[index].name)")
                            .font(.system(size: 15, weight: .bold))
                        Spacer()
                        
                        TextField("0", text: $userInput[index])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(.system(size: 15))
                            .frame(width: 50)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        for (index, pointsString) in userInput.enumerated() {
                            if pointsString == "" {
                                viewModel.addPoints(to: viewModel.players[index], point: 0)
                            } else {
                                if let points = Int(pointsString) {
                                    viewModel.addPoints(to: viewModel.players[index], point: points)
                                }
                            }
                        }
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.system(size: 15))
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 15))
                    }
                    
                    Spacer()
                }
            }
            .padding()
            
        }
}



struct AddPointView: View {
    let player: Player
    @ObservedObject var viewModel: PlayersViewModel
    @State private var newPoint: String = ""
    
    var body: some View {
        HStack {
            Text("User: \(player.name)")
            
            Spacer()
            
            TextField("Enter points", text: $newPoint)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add") {
                if let point = Int(newPoint) {
                    viewModel.addPoints(to: player, point: point)
                    newPoint = ""
                }
            }
//            if !player.points.isEmpty {
//                Text("Points: \(player.points.map(String.init).joined(separator: ", "))")
//            }
        }
        .padding()
    }
}

struct AddPointView_Previews: PreviewProvider {
    static var previews: some View {
        AddPointView(player: Player(name: "Hieu", points: [1,2]), viewModel: PlayersViewModel())
    }
}
