//
//  MovieListBuilder.swift
//  Movies
//
//  Created by Yavuz on 22.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

final class MovieListBuilder {
    
    static func make() -> MovieListViewController {
        let viewController = MovieListViewController()
        viewController.viewModel = MovieListViewModel(service: app.service)
        return viewController
    }
}
