//
//  DownloadView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/23/26.
//

import SwiftUI
import SwiftData

struct DownloadView: View {
    //sort macro sorts the downloaded list alphabetically
    @Query(sort: \Title.title) var savedTitles: [Title]
// Fetches all data and updates list automatically when db changes
    var body: some View {
        NavigationStack{
            if savedTitles.isEmpty{
                Text("No Downloads Found")
                    .padding()
                    .font(.title3)
                    .bold()
            } else {
                VerticalListView(titles: savedTitles, canDelete: true)
            }
        }
    }
}

#Preview {
    DownloadView()
}
