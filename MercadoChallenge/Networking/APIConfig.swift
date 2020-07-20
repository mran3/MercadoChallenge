//
//  APIConfig.swift
//  MercadoChallenge
//
//  Created by troquer on 7/18/20.
//  Copyright © 2020 Andrés A. All rights reserved.
//

import Foundation

final class APIConfig {
    let apiKey = "API KEY"
    let limit = "100"
    let page = 1
    let host = "api.mercadolibre.com"
    let scheme = "https"
    
    var baseURL: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        return urlComponents
    }
    
    func makeURL<T: LosslessStringConvertible>(with resources: Resources, parameters: [String: T ]) -> URL? {
        var urlComponents = baseURL
        print(resources)
        urlComponents.path = "/sites/MCO/\(resources.rawValue)"
        urlComponents.setQueryItems(with: parameters)
        guard let url = urlComponents.url else {
            print("Error create url")
            return nil
        }
        
        return url
        
    }
    
}

extension URLComponents {
    mutating func setQueryItems<T: LosslessStringConvertible>(with parameters: [String: T]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String($0.value)) }
    }
}

