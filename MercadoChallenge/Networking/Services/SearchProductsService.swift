//
//  SearchProducts.swift
//  MercadoChallenge
//
//  Created by troquer on 7/19/20.
//  Copyright © 2020 Andrés A. All rights reserved.
//

import Foundation

class SearchProductsService {
    private let apiConfig = APIConfig()
    private let jsonParser = JSONParser()
    
    func getProducts<T: Decodable>(type: T.Type, query: String, completion: @escaping FetchResult<T>) {
        
        let jsonURL = apiConfig.makeURL(with: .searchProduct, parameters: ["q" : query])
        
        jsonParser.fetchJSON(of: T.self, from: jsonURL!) { result in
            completion(result)
        }
    }
}
