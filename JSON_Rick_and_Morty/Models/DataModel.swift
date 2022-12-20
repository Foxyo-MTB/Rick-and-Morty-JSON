//
//  Model.swift
//  JSON_Rick_and_Morty
//
//  Created by Vladimir Beliakov on 19.09.2022.
//

import Foundation

struct DataModel: Codable {

    let results: [Results]
}

struct Results: Codable {
    
    let name: String
    let id: Int
    let status: String
    let species: String
    let image: String
}
