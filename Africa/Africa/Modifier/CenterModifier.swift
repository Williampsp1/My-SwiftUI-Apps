//
//  CenterModifier.swift
//  Africa
//
//  Created by William Lopez on 1/18/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
