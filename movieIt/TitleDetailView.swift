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
    let viewModel = ViewModel()
    var body: some View {
        GeometryReader{ geometry in
            switch viewModel.videoIdStatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                ProgressView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            case .success:
                ScrollView{
                    LazyVStack(alignment: .leading) {
                        YoutubePlayer(videoID: viewModel.videoId)
                            .aspectRatio(1.3, contentMode: .fit)
                        
                        Text(titleName)
                            .bold()
                            .font(.title2)
                            .padding(5)
                    }
                }
                
            case .failed(let underlyingError):
                Text(underlyingError.localizedDescription)
            }
            
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
