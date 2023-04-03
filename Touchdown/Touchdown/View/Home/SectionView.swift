//
//  SectionView.swift
//  Touchdown
//
//  Created by William Lopez on 1/22/23.
//

import SwiftUI

struct SectionView: View {
    
    @State var rotateClockWise: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees:rotateClockWise ? 90 : -90))
            
            Spacer()
        }
        .background(colorGray.cornerRadius(12))
        .frame(width: 85)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockWise: true)
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(colorBackground)
    }
}
