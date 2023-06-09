//
//  BackgroundImageView.swift
//  Devote
//
//  Created by William Lopez on 1/26/23.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        GeometryReader { geometry in
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width)
        }
        .ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
