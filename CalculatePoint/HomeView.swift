//
//  HomeView.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/12/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: PlayersViewModel
    @State var showAddSheet = false
    @State private var showingAlert = false
    @State var showTotalPoint = false
    @State var showAddPointSheet = false
    @State var showEditSheet = false
    @State var sortAscending = true
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack {
                            HStack {
                                Text("Name")
                                    .frame(width: viewModel.nameWidth())
                                    .padding(10)
                                    .foregroundColor(.black)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .padding(5)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(1...viewModel.gameCount(), id: \.self) { index in
                                            Text("\(index)")
                                                .frame(width: 30)
                                        }
                                    }
                                }
                                
                                Text("Name")
                                    .frame(width: viewModel.nameWidth())
                                    .padding(10)
                                    .foregroundColor(.black)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .padding(5)
                            
                            }
                            .background(.white)
                            .cornerRadius(10)
                            
                            Divider()
                        }
                        .font(.system(size: 15, weight: .bold))
//                        .foregroundColor(.white)
                        
                        ForEach(viewModel.players) { player in
                            PlayerRowView(player: player, showTotalPoint: $showTotalPoint, nameWidth: viewModel.nameWidth())
                            
                        }
                    }
                }
                .navigationTitle("Round \(viewModel.gameCount() + 1)")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showEditSheet.toggle()
                        } label: {
                            Text("Edit")
                                .padding(10)
//                                .background(.white)
//                                .cornerRadius(90)
                        }
                        .sheet(isPresented: $showEditSheet) {
                            Text("Hello World")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddSheet.toggle()
                        } label: {
                            Text("Add")
                                .padding(10)
//                                .background(.white)
//                                .cornerRadius(90)
                        }
                        .sheet(isPresented: $showAddSheet) {
                            AddPlayerView(viewModel: viewModel)
                            
                        }
                    }
                }
                
                HStack {
                
                    Button {
                        showingAlert.toggle()
                    } label: {
                        Image(systemName: "trash")
                            .padding(.horizontal)
                    }
                    
                    Divider()
                        .frame(height: 30)
                        .padding(.horizontal, 10)
                    
                    Button {
                        showAddPointSheet.toggle()
                    } label: {
                        Image(systemName: "gamecontroller")
                            .padding(.horizontal, 10)
                    }
                    .sheet(isPresented: $showAddPointSheet) {
                        let userInput = Array(repeating: "", count: viewModel.players.count)
                        AddPointsView(viewModel: viewModel, userInput: userInput)
                    }
                    
                    Divider()
                        .frame(height: 30)
                        .padding(.horizontal, 10)
                    
                    Button {
                        showTotalPoint.toggle()
                    } label: {
                        Image(systemName: showTotalPoint ? "bitcoinsign.circle.fill" : "bitcoinsign.circle")
                            .padding(.horizontal, 10)
                    }
                    
                    Divider()
                        .frame(height: 30)
                        .padding(.horizontal, 10)
                    
                    Button {
                        sortAscending.toggle()
                        viewModel.sortPoints(isAscending: sortAscending)
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.square")
                            .padding(.horizontal, 10)
                    }
                }
                .font(.system(size: 20))
                .padding(10)
                .background(.white)
                .cornerRadius(90)
            }
            .padding(.horizontal)
            .background(
                LinearGradient(colors: [.mint, .blue], startPoint: .top, endPoint: .bottom)
            )
            
        }
        .alert("Remove all ????????????", isPresented: $showingAlert) {
            Button("Yes", role: .destructive) {
                viewModel.removeAllPlayers()
            }
            
            Button("Cancel", role: .cancel) { }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: PlayersViewModel())
    }
}
