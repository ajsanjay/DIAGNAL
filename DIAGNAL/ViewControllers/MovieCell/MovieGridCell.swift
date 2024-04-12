//
//  MovieGridCell.swift
//  DIAGNAL
//
//  Created by Jaya Sabeen on 07/04/24.
//

import SwiftUI

struct MovieGridCell: View {
    
    let data: Movie
    
    var body: some View {
        VStack {
            if let image = UIImage(named: data.posterImage) {
                Image(uiImage: image)
                    .resizable()
            }
            Text(data.name)
                .padding(.bottom, 20)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MovieGridCell(data: Movie(name: "Rear Window", posterImage: "poster2.jpg"))
}
