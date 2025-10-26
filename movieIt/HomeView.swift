//
//  HomeView.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/26/25.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: heroTestTitle)) {
                image in
                image
                    .resizable()
                    .scaledToFit()
            }
            placeholder: {
                ProgressView()
            }
            HStack{
                Button {
                } label: {
                    Text(Constants.playString)
                        .ghostButton()
                }
                Button {
                } label: {
                    Text(Constants.downloadString)
                        .ghostButton()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
