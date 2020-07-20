//
//  ListProductsPresenter.swift
//  MercadoChallenge
//
//  Copyright © 2020 Andrés A. All rights reserved.
//

import Foundation

class ListProductsPresenter {
    weak var viewController: ProductsTableViewController?
    private var productsService = SearchProductsService()
    
    func getProducts(searchTerm: String) {
        productsService.getProducts(type: ProductResponse.self, query: searchTerm) { result in
            switch result {
            case .failure(let error):
                if error is DataError {
                    print("DataError = \(error)")
                } else {
                    print(error.localizedDescription)
                }
            case .success(let response):
                self.viewController?.productsLoaded(products: response.results)
            }
        }
    }
}


