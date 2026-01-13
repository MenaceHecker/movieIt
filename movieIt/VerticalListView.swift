//
//  VerticalListView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/9/26.
//

import SwiftUI

struct VerticalListView: View {
    var titles: [Title]
    
    var body: some View {
        List(titles) { title in
            AsyncImage(url: (title.posterPath.flatMap(URL.init(string:)))) { image in
                HStack{
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(5)
                    
                    Text((title.name ?? title.title) ?? "")
                        .font(.system(size: 14))
                        .bold()
                }
            }
            placeholder: {
                    ProgressView()
                }
            .frame(height: 150)
            }
        }
    }

#Preview {
    VerticalListView(titles: Title.previewTitles)
}

