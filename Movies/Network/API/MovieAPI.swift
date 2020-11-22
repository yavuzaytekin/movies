//
//  MovieAPI.swift
//  Movies
//
//  Created by Yavuz on 20.11.2020.
//  Copyright © 2020 Yavuz Aytekin. All rights reserved.
//
//
import Foundation
import Alamofire

protocol MovieAPIProtocol {
    func fetchMovies(with name: String? ,completion: @escaping (Result<APIResults>) -> Void)
    func fetchImage(path: URL, completion: @escaping (Result<Data>) -> Void)
}

open class MovieAPI: MovieAPIProtocol {
    
    enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    func fetchMovies(with name: String?, completion: @escaping (Result<APIResults>) -> Void) {
        //TODO: batmani degis
        AF.request(AppConstants.API.BaseURL + "s=" + (name ?? "")).responseData { response in
            switch response.result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode(APIResults.self, from: value)
                    completion(.success(results))
                    print(results)
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                    print(error)
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
                print(error)
            }
        }
    }
    
    func fetchImage(path: URL, completion: @escaping (Result<Data>) -> Void) {
        AF.download(path).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
