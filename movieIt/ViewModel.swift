//
//  ViewModel.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/30/25.
//

import Foundation
 //observable allows viewmodel to automatically modify UI of any data changes. Cannot use struct with observable
@Observable
class ViewModel{
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies : [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    var heroTitle = Title.previewTitles[0]
    
    func getTitles() async{
        homeStatus = .fetching
        if(trendingMovies.isEmpty)
        {
            
            do{
                async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tTv = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tRMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tRTV = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTV = try await tTv
                topRatedMovies = try await tRMovies
                topRatedTV = try await tRTV
                homeStatus = .fetching
            } catch {
                print(error)
                homeStatus = .failed(underlyingError: error)
            }
        }
        else {
            homeStatus = .success
        }
        
    }
}
