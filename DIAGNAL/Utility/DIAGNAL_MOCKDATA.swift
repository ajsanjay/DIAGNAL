//
//  DIAGNAL_MOCKDATA.swift
//  DIAGNAL
//
//  Created by Jaya Sabeen on 06/04/24.
//

import Foundation

struct DiagnalModel {
    let page: DiagnalContent
}

struct DiagnalContent {
    let title: String
    let totalContentItems: Int
    let pageNum: Int
    let pageSize: Int
    let contentItems: DiagnalContentItem
}

struct DiagnalContentItem {
    let content: [DiagnalData]
}

struct DiagnalData {
    let name: String
    let posterImage: String
}

struct MockData {
    static let page1 = DiagnalModel(page: DiagnalContent(title: "Romantic Comedy", totalContentItems: 54, pageNum: 1, pageSize: 20, contentItems: DiagnalContentItem(content: [DiagnalData(name: "The Birds", posterImage: "poster1.jpg"), DiagnalData(name: "Rear Window", posterImage: "poster2.jpg"), DiagnalData(name: "Family Pot", posterImage: "poster3.jpg"), DiagnalData(name: "Family Pot", posterImage: "poster2.jpg"), DiagnalData(name: "Rear Window", posterImage: "poster1.jpg"), DiagnalData(name: "The Birds", posterImage: "poster3.jpg"), DiagnalData(name: "Rear Window", posterImage: "poster3.jpg"), DiagnalData(name: "The Birds", posterImage: "poster2.jpg"), DiagnalData(name: "Family Pot", posterImage: "poster1.jpg"), DiagnalData(name: "The Birds", posterImage: "poster1.jpg"), DiagnalData(name: "The Birds", posterImage: "poster2.jpg"), DiagnalData(name: "Rear Window", posterImage: "poster2.jpg"), DiagnalData(name: "Family Pot", posterImage: "poster3.jpg"), DiagnalData(name: "Family Pot", posterImage: "poster2.jpg"), DiagnalData(name: "Rear Window", posterImage: "poster1.jpg"), DiagnalData(name: "The Birds", posterImage: "poster3.jpg"), DiagnalData(name: "Rear Window", posterImage: "poster3.jpg"), DiagnalData(name: "The Birds", posterImage: "poster2.jpg"), DiagnalData(name: "Family Pot", posterImage: "poster1.jpg"), DiagnalData(name: "The Birds", posterImage: "poster1.jpg")])))
}

