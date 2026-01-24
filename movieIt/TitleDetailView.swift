//
//  TitleDetailView.swift
//  movieIt
//
//  Created by Tushar Mishra on 11/12/25.
//

import SwiftUI
import SwiftData


struct TitleDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let title: Title

    var titleName: String {
        (title.name ?? title.title) ?? ""
    }

    //Correct implementaton for @Observable classes
    @State private var viewModel = ViewModel()
    
    @Environment(\.modelContext) var modelContext

    var body: some View {
        GeometryReader { geometry in
            switch viewModel.videoIdStatus {
            case .notStarted:
                EmptyView()

            case .fetching:
                ProgressView("Loading trailer…")
                    .frame(width: geometry.size.width, height: geometry.size.height)

            case .success:
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 14) {

                        YoutubePlayerView(videoID: viewModel.videoId)
                            .aspectRatio(16/9, contentMode: .fit)
                            .cornerRadius(12)
                            .padding(.horizontal)

                        Text(titleName)
                            .bold()
                            .font(.title2)
                            .padding(.horizontal)
                        
                        HStack{
                            Spacer()
                            Button {
                                let saveTitle = title
                                saveTitle.title = titleName
                                modelContext.insert(saveTitle)
                                try? modelContext.save()
                                dismiss()
                            } label: {
                                Text(Constants.downloadString)
                                    .ghostButton()
                            }

                            Spacer()
                        }
                        
                        if let overview = title.overview, !overview.isEmpty {
                            Text(overview)
                                .font(.callout)
                                .foregroundColor(.secondary)
                                .lineSpacing(4)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }

            case .failed(let underlyingError):
                Text(underlyingError.localizedDescription)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .task {
            await viewModel.getVideoId(for: titleName)
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
