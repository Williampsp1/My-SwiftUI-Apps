//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by William Lopez on 3/5/23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}
