//
//  BlankView.swift
//  Devote
//
//  Created by William Lopez on 1/27/23.
//

import SwiftUI

struct BlankView: View {
    
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .ignoresSafeArea()
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea())
    }
}
