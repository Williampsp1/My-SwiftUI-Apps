//
//  CategoryModel.swift
//  Touchdown
//
//  Created by William Lopez on 1/22/23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
