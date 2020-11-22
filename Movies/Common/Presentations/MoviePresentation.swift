//
//  MoviePresentation.swift
//  Movies
//
//  Created by Yavuz on 21.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import UIKit

final class MoviePresentation: NSObject {
    
    let title: String
    let detail: String
    let path: URL
    
    init(title: String, detail: String, path: URL) {
        self.title = title
        self.detail = detail
        self.path = path
        super.init()
    }
    
    init(movie: Movie) {
        self.title = movie.title
        self.detail = movie.type
        self.path = movie.posterPath
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MoviePresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}
