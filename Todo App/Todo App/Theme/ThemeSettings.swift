//
//  ThemeSettings.swift
//  Todo App
//
//  Created by William Lopez on 3/3/23.
//

import SwiftUI

class ThemeSettings: ObservableObject {
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(themeSettings, forKey: "Theme")
        }
    }
    
    private init() {}
    public static let shared = ThemeSettings()
}
