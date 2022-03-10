//
//  SearchResults.swift
//  DCA-Calculator
//
//  Created by Alandis Seals on 3/10/22.
//

import Foundation

struct SearchResultss: Codable {
    
    let items: [Result]
    
    enum CodingKeys: String, CodingKey {
        case items = "bestMatches"
    }
}

struct Result: Codable {
    let symbol: String
    let name: String
    let type: String
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "1. Symbol"
        case name = "2. name"
        case type = "3. type"
        case currency = "8. currency"
        
    }
}
