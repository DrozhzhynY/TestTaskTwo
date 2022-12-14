//
//  MovieFetcher.swift
//  TestTaskTwo
//
//  Created by admin on 17.08.2022.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllMovies()
    }
    
    func fetchAllMovies() {
        
        isLoading = true
        errorMessage = nil
        
        let service = MovieService()
        let API_KEY = "api_key=23a0f7ab751b1331fb9f4c59d9f93e88"
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?\(API_KEY)")
        service.fetchMovies(url: url) {[unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case.failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error.description)
                case.success(let movies):
                    self.movies = movies
                }
            }
        }
    }
}
