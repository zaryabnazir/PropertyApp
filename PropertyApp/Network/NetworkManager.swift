//
//  NetworkManager.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import Foundation

class NetworkManager {
    
    typealias GetAdsCompletion = (_ response: AdsBaseResponse?, _ error: String?) -> Void
    class func getAds(with params: HttpParameters, completion: @escaping GetAdsCompletion) {
        let request = NetworkRequest(path: ApiPath.ads, parameters: params)
        request.post { (data, error) in
            if let data = data,
                let response = AdsBaseResponse(data: data) {
                completion(response, nil)
            }
            else {
                completion(nil, error ?? "GENERAL_SERVER_ERROR".localize())
            }
        }
    }
    
}
