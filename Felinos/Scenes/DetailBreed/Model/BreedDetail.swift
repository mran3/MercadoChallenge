//
//  BreedDetail.swift
//  Felinos
//
//  Created by Andrés A. 
//  Copyright © 2020 Andrés A.. All rights reserved.
//

import Foundation

struct BreedDetail: Codable {
    let breeds: [Breed]?
    let url: String?
    
   enum CodingKeys: String, CodingKey {
       case breeds = "breeds"
       case url = "url"
   }
   
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        breeds = try container.decodeIfPresent([Breed].self, forKey: .breeds)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
