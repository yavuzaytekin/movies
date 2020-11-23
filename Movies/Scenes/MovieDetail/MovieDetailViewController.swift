//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Yavuz on 22.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class MovieDetailViewController: UIViewController {
    
    //MARK: - Properties
    let movieTitleLabel = UILabel()
    let moviePoster = UIImageView()
    
    var viewModel: MovieDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        viewModel.load()
        LoggerManager.shared.log(text: movieTitleLabel.text!)
    }
}

//MARK: - MovieDetailViewModelDelegate
extension MovieDetailViewController: MovieDetailViewModelDelegate {    
    func showDetail(_ presentation: MovieDetailPresentation) {
        movieTitleLabel.text = presentation.title
        moviePoster.image = UIImage(data: presentation.posterData)
    }
}
