//
//  FeatureItemView.swift
//  Touchdown
//
//  Created by William Lopez on 1/22/23.
//

import SwiftUI

struct FeatureItemView: View {
    
    let player: Player
    
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct FeatureItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItemView(player: players[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
