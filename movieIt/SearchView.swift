//
//  SearchView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/15/26.
//

import SwiftUI

struct SearchView: View {
    @State private var searchByMovies = true
    @State private var searchText = ""
    private let searchViewModel = SearchViewModel()
    // navigationPath variable will track and control navigation history
    @State private var navigationPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $navigationPath) {// this binds the stack's navigation state to our navigation path, letting us push and display views
            ScrollView{
                
                if let error = searchViewModel.errorMessage{
                    Text(error)
                        .foregroundStyle(.red)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                }
                //LazyVGrid Allows items to stack vertically into columns, Lazy would load items only when they are needed on screen
                LazyVGrid(columns: [GridItem(), GridItem(),  GridItem()]) {
                    ForEach(searchViewModel.searchTitles) { title in
                        AsyncImage(url: URL(string: title.posterPath ?? "")){
                            image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                        .onTapGesture {
                            navigationPath.append(<#T##value: Hashable##Hashable#>)
                        }
                    }
                }
            }
            .navigationTitle(searchByMovies ? Constants.movieSearchString : Constants.tvSearchString)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        searchByMovies.toggle()
                        
                    Task{
                        await searchViewModel.getSearchTitles(by: searchByMovies ? "movie" : "tv", for: searchText)
                    }
                }
                    label: {
                        Image(systemName: searchByMovies ? Constants.movieIconString : Constants.tvIconString)
                    }
                }
            }
            .searchable(text: $searchText, prompt: searchByMovies ? Constants.moviePlaceHolderString : Constants.tvPlaceHolderString)
            .task(id: searchText){
                try? await Task.sleep(for: .milliseconds(600))
                
                if Task.isCancelled{
                    return
                }
                await searchViewModel.getSearchTitles(by: searchByMovies ? "movie" : "tv", for: searchText)
            }
            .navigationDestination(for: Title.self) { title in
                TitleDetailView(title: title) //When the title struct is passed into our navigation path the view will navigate to title detail view passing in the tab title 
            }
        }
    }
}

#Preview {
    SearchView()
}
