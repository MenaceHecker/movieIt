//
//  ViewModel.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/30/25.
//

import Foundation
#if DEBUG
struct Logger {
    static func debug(_ message: @autoclosure () -> String) {
        #if DEBUG
        print(message())
        #endif
    }
    static func error(_ message: @autoclosure () -> String) {
        #if DEBUG
        print("❗️" + message())
        #endif
    }
}
#else
struct Logger {
    static func debug(_ message: @autoclosure () -> String) {}
    static func error(_ message: @autoclosure () -> String) {}
}
#endif
 //observable allows viewmodel to automatically modify UI of any data changes. Cannot use struct with observable
@MainActor
@Observable
class ViewModel{
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homeStatus: FetchStatus = .notStarted
    private(set) var videoIdStatus: FetchStatus = .notStarted
    private(set) var upcomingStatus: FetchStatus = .notStarted
    
    private let dataFetcher = DataFetcher()
    var trendingMovies : [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    var upcomingMovies: [Title] = []
    var heroTitle = Title.previewTitles[0]
    var videoId = ""
    
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
                
                if let title = trendingMovies.randomElement(){
                    heroTitle = title
                }
                homeStatus = .success
            } catch {
                Logger.error("Home fetch failed: \(error.localizedDescription)")
                homeStatus = .failed(underlyingError: error)
            }
        }
        else {
            homeStatus = .success
        }
        
    }
    
    func getVideoId(for title: String) async {
        videoIdStatus = .fetching
        do{
            videoId = try await dataFetcher.fetchVideoId(for: title)
            videoIdStatus = .success
        }
        catch {
            Logger.error("Video ID fetch failed for title '" + title + "': \(error.localizedDescription)")
            
            videoIdStatus = .failed(underlyingError: error)
            
        }
    }
}

