//
//  HomeView.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/26/25.
//

import SwiftUI
import SwiftData
struct HomeView: View {

    @State private var viewModel = ViewModel()
    @State private var titleDetailPath = NavigationPath()
    @Environment(\.modelContext) var modelContext
    // This grabs the connection to swift data that allows inserting, saving and deleting data anywhere in this view

    var body: some View {
        NavigationStack(path: $titleDetailPath) {

            GeometryReader { geo in
                ScrollView {
                    LazyVStack {
                        switch viewModel.homeStatus {
                        case .notStarted:
                            EmptyView()

                        case .fetching:
                            ProgressView()
                                .frame(width: geo.size.width,
                                       height: geo.size.height)

                        case .success:
                            AsyncImage(url: URL(string: viewModel.heroTitle.posterPath ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .overlay {
                                        LinearGradient(
                                            stops: [
                                                .init(color: .clear, location: 0.8),
                                                .init(color: .gradient, location: 1)
                                            ],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    }
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: geo.size.width,
                                   height: geo.size.height * 0.85)

                            HStack {
                                Button {
                                    titleDetailPath.append(viewModel.heroTitle)
                                } label: {
                                    Text(Constants.playString).ghostButton()
                                }

                                Button {
                                    modelContext.insert(viewModel.heroTitle)
                                    try? modelContext.save()
                                } label: {
                                    Text(Constants.downloadString).ghostButton()
                                }
                            }

                            HorizontalListView(header: Constants.trendingMovieString,
                                               titles: viewModel.trendingMovies){ title in
                                titleDetailPath.append(title)
                            }

                            HorizontalListView(header: Constants.trendingTVString,
                                               titles: viewModel.trendingTV){ title in
                                titleDetailPath.append(title)
                            }

                            HorizontalListView(header: Constants.topRatedMovieString,
                                               titles: viewModel.topRatedMovies){ title in
                                titleDetailPath.append(title)
                            }

                            HorizontalListView(header: Constants.topRatedTVString,
                                               titles: viewModel.topRatedTV){ title in
                                titleDetailPath.append(title)
                            }

                        case .failed(let error):
                            Text("Error: \(error.localizedDescription)")
                        }
                    }
                }
                .task {
                    await viewModel.getTitles()
                }
                .navigationDestination(for: Title.self) { title in
                    TitleDetailView(title: title)
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
