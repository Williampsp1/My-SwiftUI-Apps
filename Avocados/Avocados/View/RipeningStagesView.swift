//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by William Lopez on 2/3/23.
//

import SwiftUI

struct RipeningStagesView: View {
    
    var ripeningStages: [Ripening] = ripeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { item in
                        RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView()
    }
}
