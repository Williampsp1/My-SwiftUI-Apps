//
//  InfoView.swift
//  Slot Machine
//
//  Created by William Lopez on 2/9/23.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer / Designer", secondItem: "William Lopez")
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    FormRowView(firstItem: "Website", secondItem: "https://github.com/Williampsp1")
                    FormRowView(firstItem: "Copyright", secondItem: "© 2023 All rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                audioPlayer?.stop()
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
            .padding(.top, 30)
            .padding(.trailing, 20)
            .tint(.secondary)
        }
        .onAppear()  {
            playSound(sound: "background-music", type: "mp3")
        }
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem).foregroundColor(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
