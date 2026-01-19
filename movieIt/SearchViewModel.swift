//
//  SearchViewModel.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/19/26.
//

import Foundation
@Observable
class SearchViewModel {
    private(set) var errorMessage: String?
    private(set) var searchTitles: [Title] = []
    private let dataFetcher = DataFetcher()
}
