//
//  YoutubePlayer.swift
//  movieIt
//
//  Created by Tushar Mishra on 11/27/25.
//

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable{
    let webView = WKWebView()
    let videoID: String
    let youtubeBaseURL = APIConfig.shared?.youtubeBaseURL
    
    func makeUIView(context: Context) -> some UIView {
        webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let baseURLString = youtubeBaseURL,
              let baseURL = URL(string: baseURLString) else {
            return
        }
        let fullURL = baseURL.appending(path: videoID)
        webView.load(URLRequest(url: fullURL))
    }
}
