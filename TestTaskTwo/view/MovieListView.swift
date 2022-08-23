//
//  MovieListView.swift
//  TestTaskTwo
//
//  Created by admin on 17.08.2022.
//

import SwiftUI

struct MovieListView: View {
    let movies: [Movie]
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        Button("Logout"){
            UserService.sharedInstance.unauthenticate()
        }
        .font(.title2)
        .foregroundColor(.white)
        .frame(width: 100, height: 40)
        .background(Color.blue)
        .cornerRadius(10)
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(movies) {
                        movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")) {
                                    image in
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
                            }
                        }
                    }
                }
            }
            .navigationTitle("Popular movies")
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: [Movie]())
    }
}
