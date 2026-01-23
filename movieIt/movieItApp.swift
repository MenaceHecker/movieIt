//
//  movieItApp.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/26/25.
//

import SwiftUI
import SwiftData

@main
struct movieItApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
        //This creates a Swift Data Container that can store and manage title objects It handles saving, loading and keeps model data in sync with the databse.
    }
}
