//
//  VideoPlayerView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 22.11.2021.



//1. import AVKIT
import AVKit
import SwiftUI

struct VideoPlayerView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!)){
            //2. You can add  a watermark on top of the video
            VStack {
                Text("Watermark").font(.largeTitle).foregroundColor(.white).background(Color.black.opacity(0.7))
                    .clipShape(Capsule())
                Spacer()
            }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
