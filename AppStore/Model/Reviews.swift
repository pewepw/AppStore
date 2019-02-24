//
//  Reviews.swift
//  AppStore
//
//  Created by Harry on 24/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import Foundation

struct Reviews: Decodable  {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
}

struct Author: Decodable {
    let name: Label
}

struct Label: Decodable {
    let label: String
}
