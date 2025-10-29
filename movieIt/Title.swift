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


struct Title: Decodable, Identifiable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
}
