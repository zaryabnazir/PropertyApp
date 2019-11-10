//
//  NetworkError.swift
//  PropertyApp
//
//  Created by Zaryab on 28/08/2017.
//  Copyright © 2017 Zaryab. All rights reserved.
//

import UIKit

class NetworkError: Mappable {
    var errors: String?
    
    // MARK:- ERROR HANDLING -
    class func handle(error: Error) -> String {
        if let err = error as? URLError {
            let errorMessage: String
            switch err.code {
            case .notConnectedToInternet:
                errorMessage = "GENERAL_SERVER_ERROR".localize()
                break
            case .cannotFindHost:
                errorMessage = "UNKNOWN_SERVER".localize()
                break
            case .timedOut:
                errorMessage = "CONNECTION_TIME_OUT".localize()
                break
            case .networkConnectionLost:
                errorMessage = "CONNECTION_LOST".localize()
                break
            default:
                errorMessage = "GENERAL_SERVER_ERROR".localize()
                break
            }
            
            return errorMessage
        }
    
        let error = error as NSError
        return "\(error.localizedDescription)"
    }
    
}
