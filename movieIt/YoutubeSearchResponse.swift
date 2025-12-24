//
//  YoutubeSearchResponse.swift
//  movieIt
//
//  Created by Tushar Mishra on 12/16/25.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [itemProperties]?
}
struct itemProperties: Codable {
    let id: IdProperties?
}
struct IdProperties: Codable {
    let videoId: String?
}
