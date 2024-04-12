//
//  MoviesViewModel.swift
//  DIAGNAL
//
//  Created by Jaya Sabeen on 07/04/24.
//

import SwiftUI

final class MoviesViewModel: ObservableObject {
    
    var selectedObject: DiagnalData? {
        didSet { isShowingDetail = true }
    }
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Published var isShowingDetail = false
    @Published var isSearching = false
    @Published var filteredContentItems: [Movie] = []
    @Published var movieTitle = ""
    @Published var currentPageIndex = 0
    
    let pages = ["CONTENTLISTINGPAGE-PAGE1", "CONTENTLISTINGPAGE-PAGE2", "CONTENTLISTINGPAGE-PAGE3"]
    
    func pageContnet(page: String) -> [Movie] {
        var movies: [Movie] = []
        if let url = Bundle.main.url(forResource: page, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let MovieList = try JSONDecoder().decode(PageResponse.self, from: data)
                movies = MovieList.page.contentItems.content
                print("Decoded Person:", movies)
            } catch {
                print("Error decoding JSON:", error)
            }
        }
        return movies
    }
}
