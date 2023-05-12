//
//  YouTubeVideoPlayer.swift
//  MealFinder
//
//  Created by Deye Lei on 5/11/23.
//

import SwiftUI
import WebKit

struct YouTubeVideoPlayer: UIViewRepresentable{
    let youtubeUrl: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: youtubeUrl) else{
            print("youtube url failed")
            return
        }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
}
