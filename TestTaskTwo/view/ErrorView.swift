//
//  ErrorView.swift
//  TestTaskTwo
//
//  Created by admin on 17.08.2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var movieFetcher: MovieListViewModel
    var body: some View {
        Text("error")
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(movieFetcher: MovieListViewModel())
    }
}
