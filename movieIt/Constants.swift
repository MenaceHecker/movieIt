//
//  Constants.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/26/25.
//

import Foundation
import SwiftUI
struct Constants{
    static let homeString = "Home"
    static let searchString = "Search"
    static let upcomingString = "Upcoming"
    static let downloadString = "Download"
    static let playString = "Play"
    static let trendingMovieString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topRatedMovieString = "Top Rated Movies"
    static let topRatedTVString = "Top Rated TV"
    
    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downloadIconString = "arrow.down.to.line"
    
    static let testTitleURL = "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg"
    static let testTitleURL2 = "https://image.tmdb.org/t/p/original/wigZBAmNrIhxp2FNGOROUAeHvdh.jpg"
    static let testTitleURL3 = "https://image.tmdb.org/t/p/original/cP8PQH082SuaYLOJuuXyEQmS497.jpg"
    
    static let posterURLStart = "https://image.tmdb.org/t/p/w500"
    
    static func addPosterPath(to titles: inout[Title]) {
        for index in titles.indices{
            if let path = titles[index].posterPath{
                titles[index].posterPath = posterURLStart + path
            }
        }
    }
}

enum YoutubeURLStrings: String {
    case trailer = "trailer"
    case queryShorten = "q"
    case space = " "
    case key = "key"
}
extension Text {
    func ghostButton() -> some View {
        self
            .frame(width:100, height: 50 )
            .foregroundStyle(.buttonText)
            .bold()
            .background{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 5)
            }
    }
}
