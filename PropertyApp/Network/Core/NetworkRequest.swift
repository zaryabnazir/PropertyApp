//
//  NetworkRequest.swift
//  PropertyApp
//
//  Created by Zaryab on 28/08/2017.
//  Copyright © 2017 Zaryab. All rights reserved.
//

import UIKit
import Alamofire
typealias HttpHeaders = NSDictionary //[String:String]
typealias HttpParameters = NSDictionary

typealias NetworkCompletion = (_ result: Data?, _ error: String?) -> Void

class NetworkRequest {
    static let url: String = "https://staging.mls-connect.com/en/api/"
    private(set) var httpPath: String
    private(set) var httpParameters: HttpParameters
    private(set) var httpHeaders: HttpHeaders
    private(set) var encoding = URLEncoding.default
    
    var httpUrlString: String {
        get {
            return NetworkRequest.url + httpPath
        }
    }
    
    var queryString: String {
        get {
            var q = "?"
            for (key, value) in httpParameters {
                q = "\(q)\(key)=\(value)&"
            }
            q.removeLast()
            return q
        }
    }
    
    init(path: String, parameters: HttpParameters = [:], authRequired: Bool = true) {
        httpParameters = parameters
        httpHeaders = [:]
        httpPath = path
        if authRequired {
            addAuthorizationHeaders()
        }
    }
    
    private func addAuthorizationHeaders() {
        
        let apiKey = "123mls06"
        let apiToken = "connect456"
        let headers: NSMutableDictionary = [:]
        for (key, value) in httpHeaders {
            headers.setValue(value, forKey: key as! String)
        }
        headers.setValue(apiToken, forKey: "apiToken")
        headers.setValue(apiKey, forKey: "apiKey")
        httpHeaders = headers
    }
    
    func post(completion: @escaping NetworkCompletion) {
        let postRequest = Alamofire.request(httpUrlString, method: .post, parameters: httpParameters as? Parameters, encoding: encoding, headers: httpHeaders as? HTTPHeaders)
        handleJSONResponse(for: postRequest, completion: completion)
    }
    
    private func handleJSONResponse(for request: DataRequest, completion: @escaping NetworkCompletion) {
        request.responseJSON { (response) in
            let generalError = "GENERAL_SERVER_ERROR".localize()
            switch response.result
            {
            case .success(_):
                
                #if DEBUG
                if let data = response.data {
                    let responseString = String(data: data, encoding: .utf8)
                    print("\n\nDEBUG RESPONSE::\n \(responseString ?? "Data could not be converted to string")\n\n\n")
                }
                #endif
                
                if let statusCode = response.response?.statusCode,
                    200 ... 299 ~= statusCode {
                    if let data = response.data {
                        completion(data, nil)
                    }
                    else {
                        completion(nil, generalError)
                    }
                }
                else if let data = response.data,
                    let error = NetworkError(data: data) {
                    completion(nil, error.errors ?? generalError)
                }
                else {
                    completion(nil, generalError)
                }
                break
            case .failure(let err):
                completion(nil, NetworkError.handle(error: err))
            }
        }
    }
    
}

