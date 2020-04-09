//
//  Service.swift
//  inchurch-ios-challenge
//
//  Created by matela on 08/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Service {
    
    func getStatusCode<T>(response: DataResponse<T>) -> Int {
        guard let responseHTTP = response.response else {
            if let error = response.result.error as? URLError {
                return error.errorCode
            }
            return 0
        }
        return responseHTTP.statusCode
    }
    
    func getError<T>(response: DataResponse<T>) -> String {
        switch self.getStatusCode(response: response) {
        case 200...299:
            return "Ok"
        case 500...599:
            return "Unavaliable Service"
        case 404:
            return "Not found"
        case -1009:
            return "No internet connection"
        default:
            return "Try Again"
        }
    }
}
