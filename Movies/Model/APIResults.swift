//
//  APIResults.swift
//  Movies
//
//  Created by Yavuz on 21.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

struct APIResults: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case response = "Response"
        case movies = "Search"
        case totalResults
    }
    
    let response: String
    let movies: [Movie]
    let totalResults: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try values.decode(String.self, forKey: .response)
        self.movies = try values.decode([Movie].self, forKey: .movies)
        self.totalResults = try values.decode(String.self, forKey: .totalResults)
    }
    
}
