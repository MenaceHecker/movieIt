//
//  Title.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/29/25.
//
// This SwiftData framework handles storing the underlying model data, and optionally, syncing that data across multiple devices.
// The title struct will be saved in the data therefore marked with annotation Model
import SwiftData

struct TMDBAPIObject: Decodable{
    var results: [Title] = []
}
//Model View - View Model pattern helps keep the code organized by separating UI logic from business logic. 
//Hashable tells swift that two items are same, required for the navigation path
@Model
class Title: Decodable, Identifiable, Hashable{
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
    
    //Adding init tells swift data how to excatly create the class from scratch. Without this, swift data cannnot properly initialize all properties when loading model from storage
    init(id: Int?, title: String?, name: String?, overview: String?, posterPath: String?) {
        self.id = id
        self.title = title
        self.name = name
        self.overview = overview
        self.posterPath = posterPath
    }
// required init makes sure any subclass can be decoded the same way as to create the model from decoded JSON data
    required init(from decoder: any Decoder) throws {
        
    }
    
    static var previewTitles = [
        Title(id: 1, title: "Fast X", name: "Fast X", overview: "Movie about Dom Toretto or just Fast Furious", posterPath: Constants.testTitleURL),
        Title(id: 2, title: "Ad Astra", name: "Ad Astra", overview: "Movie is about Clifford McBride and his adventures", posterPath: Constants.testTitleURL2),
        Title(id: 3, title: "300 Rise of An Empire", name: "300 Rise of An Empire", overview: "Movie about Rise of Empire", posterPath: Constants.testTitleURL3)
    ]
}
