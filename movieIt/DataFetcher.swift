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
    let youtubeSearchURL = APIConfig.shared?.youtubeSearchURL
    let youtubeAPIKey = APIConfig.shared?.youtubeAPIKey
    
    func fetchTitles(for media:String, by type:String) async throws -> [Title] {
        let fetchTitleURL = try buildURL(media: media, type: type)
        guard let fetchTitlesURL = fetchTitleURL else {
            throw NetworkError.urlBuildFailed
        }
        print(fetchTitlesURL)
        var titles = try await fetchAndDecode(url: fetchTitlesURL, type: APIObject.self).results
        Constants.addPosterPath(to: &titles)
        return titles
    }
    func fetchAndDecode<T: Decodable> (url:URL, type: T.Type) async throws -> T {
        let (data,urlResponse) = try await URLSession.shared.data(from: url)
        
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(underlyingError: NSError(
                domain: "DataFetcher",
                code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]))
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type, from: data)
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
    
    func fetchVideoId(for title: String) async throws -> String? {
        guard let baseSearchURL = tmdbBaseURL else{
            throw NetworkError.missingConfig
        }
        guard let searchAPIKey = youtubeAPIKey else {
                    throw NetworkError.missingConfig
        }
        let trailerSearch = title + YoutubeURLStrings.space.rawValue + YoutubeURLStrings.trailer.rawValue
        guard let fetchVideoURL = URL(string: baseSearchURL)?.appending(queryItems: [URLQueryItem(name: YoutubeURLStrings.queryShorten.rawValue, value: trailerSearch),
                                                                                     URLQueryItem(name: YoutubeURLStrings.key.rawValue, value: searchAPIKey)              ]) else {
            throw NetworkError.urlBuildFailed
        }
        print(fetchVideoURL)
    }
}
