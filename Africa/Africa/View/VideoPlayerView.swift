//
//  VideoPlayerView.swift
//  Africa
//
//  Created by William Lopez on 1/14/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VStack {
            if let player = playVideo(fileName: videoSelected, fileFormat: "mp4") {
                VideoPlayer(player: player)
                    .overlay(
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .padding(.top, 6)
                            .padding(.horizontal, 8)
                        ,alignment: .topLeading
                    )
            } else {
                Text("Unable to play video")
                    .foregroundColor(.red)
                    .font(.title2)
            }
        }
        .tint(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
