//
//  Title.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/29/25.
//

import Foundation

struct APIObject: Decodable{
    var results: [Title] = []
}
//Model View - View Model pattern helps keep the code organized by separating UI logic from business logic. 
//Hashable tells swift that two items are same, required for the navigation path
struct Title: Decodable, Identifiable, Hashable{
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    static var previewTitles = [
        Title(id: 1, title: "Fast X", name: "Fast X", overview: "Movie about Dom Toretto or just Fast Furious", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Ad Astra", name: "Ad Astra", overview: "Movie is about Clifford McBride and his adventures", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "300 Rise of An Empire", name: "300 Rise of An Empire", overview: "Movie about Rise of Empire", posterPath: Constants.testTitleURL3)
    ]
}
