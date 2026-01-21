//
//  SearchView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/15/26.
//

import SwiftUI

struct SearchView: View {
    var titles = Title.previewTitles
    @State private var searchByMovies = true
    @State private var searchText = ""
    private let searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                //LazyVGrid Allows items to stack vertically into columns, Lazy would load items only when they are needed on screen
                LazyVGrid(columns: [GridItem(), GridItem(),  GridItem()]) {
                    ForEach(titles) { title in
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
                    }
                }
            }
            .navigationTitle(searchByMovies ? Constants.movieSearchString : Constants.tvSearchString)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        searchByMovies.toggle()
                    } label: {
                        Image(systemName: searchByMovies ? Constants.movieIconString : Constants.tvIconString)
                    }
                }
            }
            .searchable(text: $searchText, prompt: searchByMovies ? Constants.moviePlaceHolderString : Constants.tvPlaceHolderString)
        }
    }
}

#Preview {
    SearchView()
}
