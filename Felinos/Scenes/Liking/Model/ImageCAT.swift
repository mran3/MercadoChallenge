//
//  ImageCAT.swift
//  Felinos
//
//  Created by Andrés A.
//  Copyright © 2020 Andrés A.. All rights reserved.
//

import Foundation

struct ImageCAT: Codable {
    let id: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
           case id
           case url
    }
       
       init() {
           id = ""
           url = ""
       }
}
