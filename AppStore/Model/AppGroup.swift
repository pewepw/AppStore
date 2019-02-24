//
//  AppGroup.swift
//  AppStore
//
//  Created by Harry on 17/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

//import Foundation
//
//struct AppGroup: Decodable {
//    let feed: Feed
//}
//
//struct Feed: Decodable {
//    let title: String
//    let results: [FeedResult]
//}
//
//struct FeedResult: Decodable {
//    let artistName, name, artworkUrl100: String
//}
import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let id: String
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [FeedResult]
}

struct Link: Decodable {
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
}

struct FeedResult: Decodable {
    let artistName, id, releaseDate, name: String
    let kind: Kind
    let copyright, artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

struct Genre: Decodable {
    let genreID, name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Decodable {
    case iosSoftware = "iosSoftware"
}
