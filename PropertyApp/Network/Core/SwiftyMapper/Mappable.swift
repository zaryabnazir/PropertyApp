//
//  Mappable.swift
//  PropertyApp
//
//  Created by Zaryab on 05/01/2018.
//  Copyright © 2018 Zaryab. All rights reserved.
//

import Foundation

protocol Mappable: Decodable {
    init?(jsonString: String)
    init?(data: Data)
}

extension Mappable {
    
    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else { return nil }
        self.init(data: data)
    }
    
    init?(data: Data) {
        do {
            self = try JSONDecoder().decode(Self.self, from: data)
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
