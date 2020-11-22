//
//  Movie.swift
//  Movies
//
//  Created by Yavuz on 21.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import Foundation

public struct Movie: Decodable {
    
    var movieId: String
    var title: String
    var type: String
    var year: String
    var posterPath: URL

    private enum CodingKeys : String, CodingKey {
        case movieId = "imdbID"
        case title = "Title"
        case type = "Type"
        case year = "Year"
        case posterPath = "Poster"
    }
}
