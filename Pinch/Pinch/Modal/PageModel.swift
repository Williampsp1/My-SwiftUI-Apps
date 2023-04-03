//
//  PageModel.swift
//  Pinch
//
//  Created by William Lopez on 9/24/22.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
