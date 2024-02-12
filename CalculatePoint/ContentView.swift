//
//  ContentView.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(viewModel: PlayersViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
