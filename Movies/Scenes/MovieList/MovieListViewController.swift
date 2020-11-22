//
//  ViewController.swift
//  Movies
//
//  Created by Yavuz on 20.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    //MARK: - Properties
    let cellId = "cell"
    let tableView = UITableView()
    let searchBar = UISearchBar()
    let activityView = UIActivityIndicatorView(style: .large)
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var movieList: [MoviePresentation] = []
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupSearch()
        viewModel.load(with: nil)
        addObservers()
    }
}

//MARK: - Observers
extension MovieListViewController {
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
   @objc func keyboardWillShow(_ notification:Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

//MARK: - MovieListViewModelDelegate
extension MovieListViewController: MovieListViewModelDelegate {
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .setLoading(let value):
            if value {
                activityView.startAnimating()
            } else {
                activityView.stopAnimating()
            }
            print("Loading - \(value)")
        case.showMovieList(let presentations):
            self.movieList = presentations
            tableView.reloadData()
        case.updateTitle(let title):
            navigationItem.title = title
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = MovieDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}

//MARK: - UISearchBarDelegate
extension MovieListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.load(with: searchText)
    }
}

//MARK: - TableViewDelegate
extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MovieListCell
        let posterData = (cell.moviePoster.image?.pngData())!
        
        viewModel.selectMovie(at: indexPath.row, with: posterData)
    }
}

//MARK: - TableViewDataSource
extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if movieList.count == 0 {
            tableView.setEmptyView(title: "We didn't find any movie.", message: "We are really upset.")
        }
        else {
            tableView.restore()
        }
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieListCell
        let movie = movieList[indexPath.row]
        cell.movieTitleLabel.text = movie.title
        cell.selectionStyle = .none
        
        viewModel.fetchImage(path: movie.path) { result in
            switch result {
            case .success(let data):
                cell.moviePoster.image = UIImage(data: data)
            case .failure(let error):
                print(error)
            }
        }
        
        return cell
    }
}
