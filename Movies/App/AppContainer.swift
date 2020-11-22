//
//  AppContainer.swift
//  Movies
//
//  Created by Yavuz on 22.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let service = MovieAPI()
    let router = AppRouter()
}
