//
//  DataFetcher.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/30/25.
//

import Foundation

let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey


func fetchTitles(for media:String) async throws -> [Title] {
    guard let baseURL = tmdbBaseURL else{
        throw NetworkError.missingConfig
    }
    guard let apiKey = tmdbAPIKey else {
        throw NetworkError.missingConfig
    }
    
    let fetchTitlesURL = URL (string: baseURL)?
        .appending(path: "3/trending\(media)/day")
        .appending(queryItems: [
            URLQueryItem(name: "api_key", value: apiKey)
        ])
}
