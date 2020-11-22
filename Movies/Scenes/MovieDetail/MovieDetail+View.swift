//
//  MovieDetail+View.swift
//  Movies
//
//  Created by Yavuz on 22.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import Foundation

extension MovieDetailViewController {
    
    func setupViews() {
        addSubViews()
        setupMoviePosterImageView()
        setupMovieTitleLabel()
    }
    
    func addSubViews() {
        view.addSubview(moviePoster)
        view.addSubview(movieTitleLabel)
    }
    
    func setupMoviePosterImageView() {
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        
        moviePoster.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moviePoster.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
    }
    
    func setupMovieTitleLabel() {
        
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 40).isActive = true
        movieTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        movieTitleLabel.text = "PlaceHolder"
    }
}
