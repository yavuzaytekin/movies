//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Yavuz on 22.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import Foundation

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    weak var delegate: MovieDetailViewModelDelegate?
    private let presentation: MovieDetailPresentation
    
    init(movie: Movie, posterData: Data) {
        self.presentation = MovieDetailPresentation(movie: movie, posterData: posterData)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
