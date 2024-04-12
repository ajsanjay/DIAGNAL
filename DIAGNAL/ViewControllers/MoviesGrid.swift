//
//  MoviesGrid.swift
//  DIAGNAL
//
//  Created by Jaya Sabeen on 06/04/24.
//

import SwiftUI

struct MoviesGrid: View {
    @StateObject var viewModel: MoviesViewModel
    @Binding var isMoviesList: Bool
    
    init(isMoviesList: Binding<Bool>) {
        self._isMoviesList = isMoviesList
        self._viewModel = StateObject(wrappedValue: MoviesViewModel()) // Initialize viewModel inside init
        configureNavigationBarAppearance()
    }
    
    private func configureNavigationBarAppearance() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "NavBar"), for: .default)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(viewModel.filteredContentItems.indices, id: \.self) { index in
                        MovieGridCell(data: viewModel.filteredContentItems[index])
                            .frame(height: screenHeight * 0.3)
                            .id(index)
                            .onAppear {
                                // Check if this is the last item and not already reached bottom
                                if index == viewModel.filteredContentItems.indices.last {
                                    viewModel.currentPageIndex = viewModel.currentPageIndex + 1
                                    if viewModel.currentPageIndex < viewModel.pages.count {
                                        viewModel.filteredContentItems.append(contentsOf: viewModel.pageContnet(page: viewModel.pages[viewModel.currentPageIndex]))
                                    }
                                }
                            }
                    }
                }
                .padding()
            }
            .onTapGesture {
                viewModel.isSearching = false
                viewModel.movieTitle = ""
                filterContentItems()
            }
            .background(Color.black)
            .navigationBarTitle("Romantic Comedy", displayMode: .automatic)
            .overlay(
                Group { // Use Group for conditional overlay
                    if viewModel.isSearching {
                        TextField("Search Text", text: $viewModel.movieTitle, onCommit: {
                            withAnimation {
                                filterContentItems()
                            }
                        })
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(Color.white.opacity(1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    }
                },
                alignment: .top
            )
            .foregroundColor(.white)
            .navigationBarItems(
                leading: Button(action: {
                    isMoviesList = false
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.title)
                },
                trailing: Button(action: {
                    withAnimation {
                        viewModel.isSearching = true
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .font(.title2)
                }
            )
        }
        .onAppear {
            viewModel.currentPageIndex = 0
            viewModel.filteredContentItems = viewModel.pageContnet(page: viewModel.pages[viewModel.currentPageIndex])
            filterContentItems()
        }
    }
    
    private func filterContentItems() {
        if viewModel.isSearching {
            viewModel.filteredContentItems = viewModel.filteredContentItems.filter { item in
                return item.name.lowercased().contains(viewModel.movieTitle.lowercased())
            }
        } else {
            viewModel.filteredContentItems = viewModel.filteredContentItems
        }
    }
}


#Preview {
    MoviesGrid(isMoviesList: .constant(false))
}
