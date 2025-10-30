//
//  APIConfig.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/29/25.
//

import Foundation
struct APIConfig : Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    
    static let shared: APIConfig? = {
        
    }()
    private static func loadConfig() throws -> APIConfig {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            throw fatalError("APIConfig.json does not exist")
        }
        do{
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(APIConfig.self, from: data)
            
        } catch let error as DecodingError{
            throw APIConfigError.decodingFailed(underlyingError: error)
        }
        catch{
            throw APIConfigError.dataLoadingFailed(underlyingError: error)
        }
    }
}
