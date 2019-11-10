//
//  Address.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import UIKit

class Address: Mappable {
    let showPinToCityCenter: Bool?
    let addressFormatted: String?
    let streetNumber: Int?
    let streetName: String?
    let zipcode: String?
    let locality: String?
    let sublocality: String?
    let latitude: Double?
    let longitude: Double?
    let administrativeAreaLevel1: String?
    let administrativeAreaLevel2: String?
    let country: String?
    let localityId: Int?
    let sublocalityId: Int?
    let countryId: Int?
    let administrativeAreaLevel1Id: Int?

    enum CodingKeys: String, CodingKey {

        case showPinToCityCenter = "showPinToCityCenter"
        case addressFormatted = "address_formatted"
        case streetNumber = "street_number"
        case streetName = "street_name"
        case zipcode = "zipcode"
        case locality = "locality"
        case sublocality = "sublocality"
        case latitude = "latitude"
        case longitude = "longitude"
        case administrativeAreaLevel1 = "administrative_area_level1"
        case administrativeAreaLevel2 = "administrative_area_level2"
        case country = "country"
        case localityId = "locality_id"
        case sublocalityId = "sublocality_id"
        case countryId = "country_id"
        case administrativeAreaLevel1Id = "administrative_area_level1_id"
    }
}
