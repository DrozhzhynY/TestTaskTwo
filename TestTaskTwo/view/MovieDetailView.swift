//
//  MovieDetailView.swift
//  TestTaskTwo
//
//  Created by admin on 19.08.2022.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottom) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")) { image in
                        image.resizable()
                             .scaledToFill()
                             .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                    Text(movie.title)
                        .foregroundColor(.white)
                        .padding([.bottom, .top], 20)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(.black.opacity(0.7))
                    Spacer()
                }
                
                VStack{
                    Text("Synopsis")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                    Text(movie.overview)
                }
                
                Spacer()
            }.padding()
            .navigationBarTitle("Movie details")
        }
    }
}
