//
//  DownloadView.swift
//  movieIt
//
//  Created by Tushar Mishra on 1/23/26.
//

import SwiftUI
import SwiftData

struct DownloadView: View {
    
    @Query var savedTitles: [Title]
// Fetches all data and updates list automatically when db changes
    var body: some View {
        
    }
}

#Preview {
    DownloadView()
}
