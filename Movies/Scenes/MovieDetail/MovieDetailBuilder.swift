//
//  MovieDetailBuilder.swift
//  Movies
//
//  Created by Yavuz on 22.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import Foundation

final class MovieDetailBuilder {
    
    static func make(with viewModel: MovieDetailViewModelProtocol) -> MovieDetailViewController {
        let viewController = MovieDetailViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
