//
//  FactModel.swift
//  Avocados
//
//  Created by William Lopez on 2/5/23.
//

import SwiftUI

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
