//
//  PlayerRowView.swift
//  CalculatePoint
//
//  Created by Hieu Le on 2/12/24.
//

import SwiftUI

struct PlayerRowView: View {
    var player: Player
    @Binding var showTotalPoint: Bool
    let nameWidth: CGFloat
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    if showTotalPoint {
                        VStack {
                            Text("\(player.name)")
                            
                            Text("\(player.totalPoint())")
                                .font(.system(size: 15))
                        }
                        .padding(.vertical, 7)
                    } else {
                        Text("\(player.name)")
                            .padding(.vertical)
                    }
                }
                .frame(width: nameWidth)
                .padding(.horizontal)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(player.points, id: \.self) { point in
                            Text("\(point)")
                                .frame(width: 30)
                        }
                    }
                }
                
                VStack {
                    if showTotalPoint {
                        VStack {
                            Text("\(player.name)")
                            
                            Text("\(player.totalPoint())")
                                .font(.system(size: 15))
                        }
                        .padding(.vertical, 7)
                    } else {
                        Text("\(player.name)")
                            .padding(.vertical)
                    }
                }
                .frame(width: nameWidth)
                .padding(.horizontal)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(10)
            }
            
            Divider()

        }
        .font(.system(size: 15, weight: .bold))
        .foregroundColor(.white)
        
//        .background(Color.white)
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(player: Player(name: "Bao Hieu", points: [1, 2, 3]), showTotalPoint: Binding.constant(true), nameWidth: 50)
    }
}
