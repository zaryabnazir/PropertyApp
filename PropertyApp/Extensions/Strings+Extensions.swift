//
//  Strings+Extensions.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import Foundation

extension String {
    
    var trim: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /**
     To get the localized string for the provided string,
     string value will be used if localized version not found.
     */
    func localize() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
