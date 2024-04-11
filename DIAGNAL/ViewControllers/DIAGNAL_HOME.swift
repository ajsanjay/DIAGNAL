//
//  DIAGNAL_HOME.swift
//  DIAGNAL
//
//  Created by Jaya Sabeen on 06/04/24.
//

import SwiftUI

struct DIAGNAL_HOME: View {
    
    @State private var isDisplayingMovies = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 150, height: 150)
                Text("Welcome User")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                Button(action: {
                    isDisplayingMovies = true
                }, label: {
                    CartButton(titele: "Romantic Comedy")
                })
                .padding()
            }
            .navigationTitle("DIAGNAL")
            .fullScreenCover(isPresented: $isDisplayingMovies, content: {
                MoviesGrid(isMoviesList: $isDisplayingMovies, isSearching: .constant(false))
            })
        }
    }
}

#Preview {
    DIAGNAL_HOME()
}

struct CartButton: View {
    let titele: LocalizedStringKey
    var body: some View {
        Text(titele)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.green)
            .cornerRadius(10)
    }
}

//#Preview {
//    CartButton(titele: "Add to Cart")
//}
