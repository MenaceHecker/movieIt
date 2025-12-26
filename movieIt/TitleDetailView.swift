//
//  TitleDetailView.swift
//  movieIt
//
//  Created by Tushar Mishra on 11/12/25.
//

import SwiftUI

struct TitleDetailView: View {
    let title: Title
    var titleName: String {
        return (title.name ?? title.title) ?? ""
    }
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                LazyVStack(alignment: .leading){
//                    YoutubePlayer(videoID: "pM7FL8TdB90")
//                        .aspectRatio(1.3, contentMode: .fit)
                    YoutubePlayerView(videoID: "aqz-KE-bpKQ")
                        .frame(height: 220) // or use aspectRatio if you prefer
                        .cornerRadius(12)
                        .padding(.horizontal)
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
