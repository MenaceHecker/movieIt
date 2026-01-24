//
//  UpcomingView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/14/26.
//

import SwiftUI

struct UpcomingView: View {
    @State private var navigationPath = NavigationPath()
    let viewModel = ViewModel()
    var body: some View {
        NavigationStack(path: $navigationPath) {
            GeometryReader { geo in
                switch viewModel.upcomingStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView()
                        .frame (width: geo.size.width, height: geo.size.height)
                case .success:
                    VerticalListView(titles: viewModel.upcomingMovies, canDelete: false)
                case .failed(let underlyingError):
                    Text(underlyingError.localizedDescription)
                        .errorMessage()
                        .frame(width: geo.size.width,height: geo.size.height)
                }
            }
            .task {
                await viewModel.getUpcomingMovies()
            }
            .navigationDestination(for: Title.self) { title in
                TitleDetailView(title: title)
            }
        }
    }
}

#Preview {
    UpcomingView()
}
