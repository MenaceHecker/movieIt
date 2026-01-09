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
            AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                
            } placeholder: {
                ProgressView()
            }
            }
        }
    }

#Preview {
    VerticalListView(titles: Title.previewTitles)
}
