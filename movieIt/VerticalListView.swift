//
//  VerticalListView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/9/26.
//

import SwiftUI
import SwiftData
// Added nav stack to parent view , added nav link inside child view
// nav link allows defining where the user goes and how the link looks using label
struct VerticalListView: View {
    var titles: [Title]
    let canDelete: Bool
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List(titles) { title in
            NavigationLink {
                TitleDetailView(title: title)
            } label: {
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
            // swipeActions allow us to find an edge either leading or trailing where leading is from the front and trailing is from the back
            .swipeActions(edge: .trailing) {
                if canDelete{
                    Button{
                        modelContext.delete(title)
                        try? modelContext.save()
                    }label: {
                        Image(systemName: "trash")
                            .tint(.red)
                    }
                }
            }
            
            }
        }
    }

#Preview {
    VerticalListView(titles: Title.previewTitles, canDelete: true)
}

