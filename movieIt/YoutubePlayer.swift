//
//  YoutubePlayer.swift
//  movieIt
//
//  Created by Tushar Mishra on 11/27/25.
//

//import SwiftUI
//import WebKit
//
//struct YoutubePlayer: UIViewRepresentable {
//    let videoID: String
//
//    func makeUIView(context: Context) -> WKWebView {
//        let webView = WKWebView()
//        webView.configuration.allowsInlineMediaPlayback = true
//        return webView
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        let embedURLString = "https://www.youtube.com/embed/\(videoID)"
//        if let url = URL(string: embedURLString) {
//            uiView.load(URLRequest(url: url))
//        }
//    }
//}

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true

        // Optional, but helps if you ever enable autoplay in the URL params
        config.mediaTypesRequiringUserActionForPlayback = []

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let html = """
        <!doctype html>
        <html>
          <head>
            <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
            <style>
              html, body { margin:0; padding:0; height:100%; background:black; }
              iframe { position:absolute; top:0; left:0; width:100%; height:100%; border:0; }
            </style>
          </head>
          <body>
            <iframe
              src="https://www.youtube.com/embed/\(videoID)?playsinline=1&modestbranding=1&rel=0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              allowfullscreen>
            </iframe>
          </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: URL(string: "https://www.youtube.com"))
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator: NSObject, WKNavigationDelegate {
        // Optional: useful for debugging if you want to add print statements later.
    }
}

