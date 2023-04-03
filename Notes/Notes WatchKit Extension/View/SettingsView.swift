//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by William Lopez on 1/30/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: { self.value }, set: {(newValue) in
                if newValue > 0 {
                self.value = newValue
                self.update()
                }
            }), in: 0...4, step: 1)
                .tint(.accentColor)
        }.onAppear() {
            value = Float(lineCount)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
