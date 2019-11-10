//
//  Stringify.swift
//  PropertyApp
//
//  Created by Zaryab on 05/01/2018.
//  Copyright © 2018 Zaryab. All rights reserved.
//

import Foundation

protocol Stringify: Encodable {
    var json: String? { get }
}

extension Stringify {
    var json: String? {
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        }
        catch (let err) {
            print(err)
            return nil
        }
    }
}
