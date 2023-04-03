//
//  CreditsView.swift
//  Africa
//
//  Created by William Lopez on 1/18/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright @ William Lopez
    All rights reserved
    Better Apps ♡ Less Code
    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
