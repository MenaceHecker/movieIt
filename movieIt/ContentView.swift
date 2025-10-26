//
//  ContentView.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house"){
                Text("Home")
            }
        }
    }
}

#Preview {
    ContentView()
}
