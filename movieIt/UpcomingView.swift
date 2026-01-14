//
//  UpcomingView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/14/26.
//

import SwiftUI

struct UpcomingView: View {
    let viewModel = ViewModel()
    var body: some View {
        VerticalListView(titles: viewModel.upcomingMovies)
    }
}

#Preview {
    UpcomingView()
}
