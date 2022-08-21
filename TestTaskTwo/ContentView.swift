//
//  ContentView.swift
//  TestTaskTwo
//
//  Created by admin on 16.08.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userService: UserService = .sharedInstance
       var body: some View {
           if let _ = userService.sessionId {
               MovieListView(movies: [Movie]())
//               Text("Home")
//               Button("Out"){
//                   UserService.sharedInstance.unauthenticate()
//               }
           } else {
               LoginView()
           }
       }
//    @StateObject var movieFetcher = MovieFetcher()
//    var body: some View {
//        if movieFetcher.isLoading {
//            LoadingView()
//        } else if movieFetcher.errorMessage != nil {
//            ErrorView(movieFetcher: movieFetcher)
//        } else {
//            MovieListView(movies: movieFetcher.movies)
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
