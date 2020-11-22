//
//  MovieList+View.swift
//  Movies
//
//  Created by Yavuz on 20.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import UIKit.UITableViewController

extension MovieListViewController {
    func setupViews() {
        registerCells()
        setupTableView()
        setupActivityIndicatory()
    }
    
    func registerCells() {
        tableView.register(MovieListCell.self, forCellReuseIdentifier: cellId)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.rowHeight = 100
    }
    
    func setupSearch() {
        searchBar.delegate = self
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
    }
    
    func setupActivityIndicatory() {
        activityView.center = self.view.center
        view.addSubview(activityView)
        view.bringSubviewToFront(activityView)
    }
}
