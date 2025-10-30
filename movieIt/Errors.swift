//
//  Errors.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/30/25.
//

import Foundation
enum APIConfigError: Error, LocalizedError{
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String?{
        switch self {
        case .fileNotFound:
            return "File not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load data with error: \(error)"
        case .decodingFailed(underlyingError: let error):
            return "Failed to decode data with error: \(error)"
        }
    }
}
