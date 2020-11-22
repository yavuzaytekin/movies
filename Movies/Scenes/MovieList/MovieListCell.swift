//
//  MovieListCell.swift
//  Movies
//
//  Created by Yavuz on 20.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import UIKit
import Alamofire

class MovieListCell: UITableViewCell {
    
    let movieTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()

    var moviePoster : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupMoviePoster()
        setupMovieTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    //MARK: - Setup Views
    func addSubviews() {
        addSubview(movieTitleLabel)
        addSubview(moviePoster)
    }
    
    func setupMoviePoster() {
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
        
        moviePoster.translatesAutoresizingMaskIntoConstraints = false
        moviePoster.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        moviePoster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        moviePoster.heightAnchor.constraint(equalToConstant: 80).isActive = true
        moviePoster.widthAnchor.constraint(equalTo: moviePoster.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setupMovieTitleLabel() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 20).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
 

