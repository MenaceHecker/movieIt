//
//  UpcomingView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/14/26.
//

import SwiftUI

struct UpcomingView: View {
    var body: some View {
        VerticalListView(titles: Title.previewTitles)
    }
}

#Preview {
    UpcomingView()
}
