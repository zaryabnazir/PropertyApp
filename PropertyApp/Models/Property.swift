//
//  Properties.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import UIKit

class Property: Mappable {
    
    let id: Int?
    let mlsId: Int?
    let reference: String?
    let mandate: String?
    let mandateType: String?
    let status: String?
    let transactionTypeId: Int?
    let transactionType: String?
    let propertyType: String?
    let propertyTypeId: Int?
    let publicationDate: Int?
    let lastModificationDate: Int?
    let brokerId: Int?
    let agencyId: Int?
    let favourite: Bool?
    let offerState: Int?
    let information: Information?
    let area: Area?
    let financial: Financial?
    let address: Address?
    let medias: [Media]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case mlsId = "mls_id"
        case reference = "reference"
        case mandate = "mandate"
        case mandateType = "mandate_type"
        case status = "status"
        case transactionTypeId = "transaction_type_id"
        case transactionType = "transaction_type"
        case propertyType = "property_type"
        case propertyTypeId = "property_type_id"
        case publicationDate = "publication_date"
        case lastModificationDate = "last_modification_date"
        case brokerId = "broker_id"
        case agencyId = "agency_id"
        case favourite = "favourite"
        case offerState = "offer_state"
        case information = "informations"
        case area = "area"
        case financial = "financial"
        case address = "address"
        case medias = "medias"
    }
}
