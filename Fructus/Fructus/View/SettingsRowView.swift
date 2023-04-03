//
//  SettingsRowView.swift
//  Fructus
//
//  Created by William Lopez on 1/8/23.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    
    var name: String
    var content: String?
    var linkLabel: String?
    var linkDestination: String?
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            
            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if linkLabel != nil && linkDestination != nil {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }
                    else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "John / Jane")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            .previewInterfaceOrientation(.landscapeLeft)
            SettingsRowView(name: "Developer", linkLabel: "William Lopez", linkDestination: "https://github.com/Williampsp1?tab=repositories")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
