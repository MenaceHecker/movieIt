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
    
    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downloadIconString = "arrow.down.to.line"
    
    static let testTitleURL = "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg"
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
