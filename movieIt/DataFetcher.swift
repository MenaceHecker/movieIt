//
//  DataFetcher.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/30/25.
//

import Foundation

struct DataFetcher{
    
    let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    
    
    func fetchTitles(for media:String, by type:String) async throws -> [Title] {
       
        print(fetchTitlesURL)
        let (data,urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(underlyingError: NSError(
                domain: "DataFetcher",
                code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]))
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var titles = try decoder.decode(APIObject.self, from: data).results
        Constants.addPosterPath(to: &titles)
        return titles
    }
    
    private func buildURL (media: String, type: String) throws -> URL? {
        guard let baseURL = tmdbBaseURL else{
            throw NetworkError.missingConfig
        }
        guard let apiKey = tmdbAPIKey else {
            throw NetworkError.missingConfig
        }
        var path:String
        if type == "trending" {
            path = "3/trending/\(media)/day"
        }
        else if type == "top_rated" {
            path = "3/\(media)/top_rated"
        }
        else {
            throw NetworkError.urlBuildFailed
        }
        
        guard let url = URL (string: baseURL)?
            .appending(path: path)
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ]) else{
            throw NetworkError.urlBuildFailed
        }
        return url
    }
}
