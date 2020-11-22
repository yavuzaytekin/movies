//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Yavuz on 21.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import Foundation

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private var movies: [Movie] = []
    let service: MovieAPIProtocol
    
    init(service: MovieAPIProtocol) {
        self.service = service
    }
    
    func load(with name: String?) {
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        service.fetchMovies(with: name) { [weak self] (results) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            switch results {
            case .success(let response):
                self.movies = response.movies
                let presenatations = response.movies.map({ MoviePresentation(movie: $0) })
                self.notify(.showMovieList(presenatations))
            case .failure(let error):
                self.notify(.showMovieList([]))
                print(error)
            }
        }
    }
    
    func fetchImage(path: URL, completion: @escaping (Result<Data>) -> Void) {
        service.fetchImage(path: path) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func selectMovie(at index: Int, with moviePosterData: Data) {
        let movie = movies[index]
        let viewModel = MovieDetailViewModel(movie: movie, posterData: moviePosterData)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
