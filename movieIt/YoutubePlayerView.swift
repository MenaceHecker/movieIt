//
//  YoutubePlayerView.swift
//  movieIt
//
//  Created by Tushar Mishra on 12/16/25.
//
import SwiftUI
import YouTubeiOSPlayerHelper

struct YoutubePlayerView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> YTPlayerView {
        let playerView = YTPlayerView()
        playerView.delegate = context.coordinator

        // Recommended vars
        let vars: [AnyHashable: Any] = [
            "playsinline": 1,
            "controls": 1,
            "rel": 0,
            "modestbranding": 1
            // "autoplay": 1   // enable if you want
        ]

        playerView.load(withVideoId: videoID, playerVars: vars)
        return playerView
    }

    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        // If you expect videoID to change dynamically, reload only when needed:
        // uiView.load(withVideoId: videoID)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    final class Coordinator: NSObject, YTPlayerViewDelegate {
        func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
            // playerView.playVideo() // if you want autoplay-like behavior after ready
        }

        func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError) {
            print("YouTube Player Error:", error)
        }
    }
}

