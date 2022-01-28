//
//  VideoPlayerView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 22.11.2021.




import AVKit
import SwiftUI

struct VideoPlayerView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!)){

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
