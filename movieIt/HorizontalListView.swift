//
//  HorizontalListView.swift
//  movieIt
//
//  Created by Tushar Mishra on 10/28/25.
//

import SwiftUI

struct HorizontalListView: View {
    let header = Constants.trendingMovieString
    var titles = [Constants.testTitleURL, Constants.testTitleURL2, Constants.testTitleURL3]
    
    
    var body: some View {
        VStack(alignment: .leading){
        Text(header)
                .font(.title)
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(titles,id:\.self){
                        title in
                        AsyncImage(url: URL(string: title))
                        
                        
                    }
                }
            }
        }
    }
}

#Preview {
    HorizontalListView()
}
