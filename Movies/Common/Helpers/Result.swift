//
//  Result.swift
//  Movies
//
//  Created by Yavuz on 21.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
