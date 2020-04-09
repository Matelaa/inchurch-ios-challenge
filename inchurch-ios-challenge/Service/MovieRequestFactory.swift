//
//  MovieRequestFactory.swift
//  inchurch-ios-challenge
//
//  Created by matela on 08/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import Foundation
import Alamofire

class MovieRequestFactory {
    
    static func getBestRatedMovies() -> DataRequest {
        let params: Parameters = ["api_key": apiKey]
        return Alamofire.request(baseURL + "/movie/popular", method: .get, parameters: params)
    }
}
