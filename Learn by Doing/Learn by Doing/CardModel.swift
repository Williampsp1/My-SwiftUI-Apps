//
//  CardModel.swift
//  Learn by Doing
//
//  Created by William Lopez on 2/2/23.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}

