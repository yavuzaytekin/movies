//
//  MovieDetailPresentation.swift
//  Movies
//
//  Created by Yavuz on 22.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import UIKit

struct MovieDetailPresentation: Equatable {
    let title: String
    let artistName: String
    let posterData: Data
    
}

extension MovieDetailPresentation {
    init(movie: Movie, posterData: Data) {
        self.init(title: movie.title,
                  artistName: movie.title,
                  posterData: posterData)
    }
}
