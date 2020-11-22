//
//  AppRouter.swift
//  Movies
//
//  Created by Yavuz on 22.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import UIKit

protocol AppRouterProtocol {
    func start(window: UIWindow?)
}

class AppRouter: AppRouterProtocol {
    
    var rootViewController: UINavigationController!

    func start(window: UIWindow?) {
        guard let window = window else { return }
        
        if !Connectivity.isConnectedToInternet {
            let alert = UIAlertController(title: "Alert", message: "You don't have internet connection. App will close when you clicked to OK button.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                exit(0)
            }))
            window.rootViewController = UIViewController()
            window.windowLevel = UIWindow.Level.alert + 1;
            window.makeKeyAndVisible()
            window.rootViewController?.present(alert, animated: true, completion: nil)
        } else {
            let movieListViewController = MovieListBuilder.make()
            rootViewController = UINavigationController(rootViewController: movieListViewController)
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
        }
    }
}
