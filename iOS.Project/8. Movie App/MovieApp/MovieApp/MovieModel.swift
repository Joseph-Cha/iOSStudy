//
//  MovieModel.swift
//  MovieApp
//
//  Created by 차동훈 on 2022/12/13.
//

import Foundation

// Codable == serializable과 동일
struct MovieModel: Codable {
    let resultCount: Int
    let results: [MovieResult]
}

struct MovieResult: Codable {
    let trackName: String?
    let previewUrl: String?
    let image: String?
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate: String?
    
    // artworkUrl100 대신 image를 쓰고 싶을 때
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName
        case previewUrl
        case shortDescription
        case longDescription
        case trackPrice
        case currency
        case releaseDate
        
    }
}
