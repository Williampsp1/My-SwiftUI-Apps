//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by William Lopez on 1/30/23.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
