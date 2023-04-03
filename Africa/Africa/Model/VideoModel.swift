//
//  VideoModel.swift
//  Africa
//
//  Created by William Lopez on 1/13/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
