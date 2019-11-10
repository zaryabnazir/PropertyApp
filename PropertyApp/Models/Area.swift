//
//  Area.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import UIKit

class Area: Mappable {
    let rooms: Int?
    let bedrooms: Int?
    let living: Double?
    let livingCarrez: Double?
    let unitId: Int?
    let unitFormatted: String?

    enum CodingKeys: String, CodingKey {

        case rooms = "rooms"
        case bedrooms = "bedrooms"
        case living = "living"
        case livingCarrez = "livingCarrez"
        case unitId = "unit_id"
        case unitFormatted = "unit_formatted"
    }
}
