//
//  ProductModel.swift
//  MVVM With RXSwift
//
//  Created by Hany Karam on 12/5/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
struct ProductModel: Codable {
    let status: Bool?
    let message: String?
    let data: ProductModelDataClass?
}
// MARK: - ProductModelDataClass
struct ProductModelDataClass: Codable {
    let currentPage: Int?
    let data: [ProductModelDatum]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL: String?
    let nextPageURL: String?
    let path: String?
    let perPage: Int?
    let prevPageURL: String?
    let to, total: Int?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - ProductModelDatum
struct ProductModelDatum: Codable {
    let id: Int?
    let price: Double?
    let oldPrice: Int?
    let discount: Int?
    let image: String?
    let name, datumDescription: String?
    let images: [String]?
    let inFavorites, inCart: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case datumDescription = "description"
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}
