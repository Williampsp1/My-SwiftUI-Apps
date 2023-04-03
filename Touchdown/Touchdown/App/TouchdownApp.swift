//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by William Lopez on 1/21/23.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
