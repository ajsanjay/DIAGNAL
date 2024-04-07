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
}
