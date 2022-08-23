//
//  ContentView.swift
//  TestTaskTwo
//
//  Created by admin on 16.08.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userService: UserService = .sharedInstance
    @StateObject var movieFetcher = MovieListViewModel()
       var body: some View {
           if let _ = userService.sessionId {
               MovieListView(movies: movieFetcher.movies)
           } else {
               LoginView()
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
