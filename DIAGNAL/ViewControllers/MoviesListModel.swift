//
//  MoviesListModel.swift
//  DIAGNAL
//
//  Created by Jaya Sabeen on 12/04/24.
//

import Foundation

struct Movie: Codable {
    let name: String
    let posterImage: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case posterImage = "poster-image"
    }
}

struct ContentItems: Codable {
    let content: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
    }
}

struct Page: Codable {
    let title: String
    let totalContentItems: String
    let pageNum: String
    let pageSize: String
    let contentItems: ContentItems
    
    enum CodingKeys: String, CodingKey {
        case title
        case totalContentItems = "total-content-items"
        case pageNum = "page-num"
        case pageSize = "page-size"
        case contentItems = "content-items"
    }
}

struct PageResponse: Codable {
    let page: Page
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
    }
}
