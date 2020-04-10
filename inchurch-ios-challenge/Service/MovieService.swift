//
//  MovieService.swift
//  inchurch-ios-challenge
//
//  Created by matela on 08/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MovieService: Service {
    
    var getBestRatedMovieRequest: Request?
    
    var delegate: StatefulViewController!
    
    init(delegate: StatefulViewController) {
        self.delegate = delegate
    }
    
    func getBestRatedMovies() {
        self.getBestRatedMovieRequest?.cancel()
        self.getBestRatedMovieRequest = MovieRequestFactory.getBestRatedMovies().validate().responseArray(keyPath: "results", completionHandler: { (response: DataResponse<[Movie]>) in
            switch response.result {
            case .success:
                if let movies = response.result.value {
                    MovieViewModel.deleteAll()
                    MovieViewModel.saveAll(movies: movies)
                }
                
                self.delegate.success(.getBestRatedMovies)
            case .failure:
                self.delegate.failure(.getBestRatedMovies, error: self.getError(response: response))
            }
        })
    }
}
