//
//  SearchResult.swift
//  AppStore
//
//  Created by Harry on 16/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
    let formattedPrice: String?
    let description: String
    let releaseNotes: String?
}
