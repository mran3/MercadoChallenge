//
//  Breed.swift
//  Felinos
//
//  Copyright © 2020 Andrés A.. All rights reserved.
//

import Foundation

struct Breed: Codable {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var temperament: String = ""
    var lifeSpan: String = ""
    var wikipediaUrl: String?  = ""
}
