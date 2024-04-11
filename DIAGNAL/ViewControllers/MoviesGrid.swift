//
//  MoviesGrid.swift
//  DIAGNAL
//
//  Created by Jaya Sabeen on 06/04/24.
//

import SwiftUI

struct MoviesGrid: View {
    
    @Binding var isMoviesList: Bool
    @Binding var isSearching: Bool
    
    init(isMoviesList: Binding<Bool>, isSearching: Binding<Bool>) {
        // Initialize the isMoviesList binding
        self._isMoviesList = isMoviesList
        self._isSearching = isSearching
        
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this to handle the background colour of navigation bar
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "NavBar"), for: .default)
    }
    
    @StateObject var viewModel = MoviesViewModel()
        
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.page1.page.contentItems.content.indices, id: \.self) { index in
                        MovieGridCell(data: MockData.page1.page.contentItems.content[index])
                            .frame(height: screenHeight * 0.3)
                    }
                }
                .padding()
            }
            .background(.black)
            .navigationBarTitle("Romantic Comedy", displayMode: .automatic)
            .foregroundColor(.white)
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        isMoviesList = false
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .foregroundColor(.blue)
                },
                trailing: HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                }
            )
        }
    }
}

#Preview {
    MoviesGrid(isMoviesList: .constant(false), isSearching: .constant(false))
}
