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
        print("YouTube videoID:", videoID)
        let debugURL = "https://www.youtube.com/embed/\(videoID)?playsinline=1&controls=1&rel=0&modestbranding=1"
        print("Expected embed URL:", debugURL)

        if videoID.count != 11 || videoID.range(of: #"^[A-Za-z0-9_-]{11}$"#, options: .regularExpression) == nil {
            print("Warning: Unexpected YouTube videoID format:", videoID, "length:", videoID.count)
        }

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
            switch error {
            case .invalidParam:
                print("YouTube Player Error: invalidParam — likely a bad videoID or playerVar.")
            case .html5Error:
                print("YouTube Player Error: html5Error — playback failed in the iFrame.")
            case .videoNotFound:
                print("YouTube Player Error: videoNotFound — ID doesn’t exist or is private.")
            case .notEmbeddable:
                print("YouTube Player Error: notEmbeddable — uploader disabled embedding or restricted.")
            case .unknown:
                fallthrough
            @unknown default:
                print("YouTube Player Error: unknown")
            }
        }
    }
}

