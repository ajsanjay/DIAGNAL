//
//  MovieGridCell.swift
//  DIAGNAL
//
//  Created by Jaya Sabeen on 07/04/24.
//

import SwiftUI

struct MovieGridCell: View {
    
    let data: DiagnalData
    
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
    MovieGridCell(data: MockData.page1.page.contentItems.content[0])
}
