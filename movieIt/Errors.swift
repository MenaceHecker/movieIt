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
}
