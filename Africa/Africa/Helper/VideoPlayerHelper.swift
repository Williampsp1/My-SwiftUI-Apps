//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by William Lopez on 1/14/23.
//

import Foundation
import AVKit

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    guard let url: URL = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        return nil
    }
    
    let videoPlayer: AVPlayer = AVPlayer(url: url)
    
    videoPlayer.play()
    return videoPlayer
}
