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
                
            case .failed(let underlyingError):
                
            }
            
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
