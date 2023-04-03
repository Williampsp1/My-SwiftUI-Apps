//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by William Lopez on 1/22/23.
//

import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing) {
                Section(header: SectionView(rotateClockWise: false), footer: SectionView(rotateClockWise: true)) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }
            }
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
