//
//  Financial.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import UIKit

class Financial: Mappable {
    let price: Int?
    let priceFormatted: String?

    enum CodingKeys: String, CodingKey {

        case price = "price"
        case priceFormatted = "price_formatted"
    }
}
