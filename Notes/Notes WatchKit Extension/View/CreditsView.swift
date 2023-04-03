//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by William Lopez on 1/30/23.
//

import SwiftUI

struct CreditsView: View {
    
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    var body: some View {
        VStack(spacing: 3) {
            Image("developer-no1")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            HeaderView(title: "Credits")
            
            Text("William Lopez")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
