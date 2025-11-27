//
//  APIConfig.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/29/25.
//

import Foundation

struct APIConfig: Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    let youtubeBaseURL: String
    
    static let shared: APIConfig? = {
        do {
            return try loadConfig()
        } catch {
            print("Failed to load APIConfig: \(error.localizedDescription)")
            return nil
        }
    }()
    
    private static func loadConfig() throws -> APIConfig {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            //guard keyword is used to transfer program control out of a scope if one or more conditions are not met.
            throw APIConfigError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(APIConfig.self, from: data)
        } catch let decodingError as DecodingError {
            throw APIConfigError.decodingFailed(underlyingError: decodingError)
        } catch {
            throw APIConfigError.dataLoadingFailed(underlyingError: error)
        }
    }
}
