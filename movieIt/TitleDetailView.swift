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
                    AsyncImage(url: URL(string: title.posterPath ?? ""))
                }
            }
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
