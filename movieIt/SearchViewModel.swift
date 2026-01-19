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
    
//media will change according to movie or tv search, title will search for the user input, async is used as this function makes network call
    func getSearchTitles(by media: String, for title: String) async {
        
    }
}
