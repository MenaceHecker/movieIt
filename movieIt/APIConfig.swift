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
    
    static let shared: APIConfig = {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            fatalError("APIConfig.json does not exist")
        }
        do{
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(APIConfig.self, from: data)
            
        } catch{
            fatalError("Failed to find or deocde APIConfig.json: \(error)")
        }
    }()
}
