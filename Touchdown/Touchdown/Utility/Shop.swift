//
//  Shop.swift
//  Touchdown
//
//  Created by William Lopez on 1/25/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product?
}
