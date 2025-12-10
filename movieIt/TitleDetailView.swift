//
//  TitleDetailView.swift
//  movieIt
//
//  Created by Tushar Mishra on 11/12/25.
//

import SwiftUI

struct TitleDetailView: View {
    let title: Title
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                LazyVStack(alignment: .leading){
                    YoutubePlayer(videoID: "jEm75y-R5wY")
                        .aspectRatio(1.3, contentMode: .fit)
                    Text((title.name ?? title.title) ?? "")
                        .font(.largeTitle)
                        .bold()
                        .font(.title2)
                        .padding(5)
                    
                    Text(title.overview ?? "")
                        .font(.body)
                        .padding(5)
                    
                }
            }
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
