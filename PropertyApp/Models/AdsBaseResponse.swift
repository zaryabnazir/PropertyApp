//
//  AdsBaseResponse.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import Foundation

class AdsBaseResponse: Mappable {
    let adsCount: Int?
    let pageCount: Double?
    let currentPage: Int?
    let properties: [Property]?

    enum CodingKeys: String, CodingKey {

        case adsCount = "ads_count"
        case pageCount = "page_count"
        case currentPage = "current_page"
        case properties = "properties"
    }
    
}
