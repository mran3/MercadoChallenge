//
//  ProductDetailPresenter.swift
//  MercadoChallenge
//
//  Created by troquer on 7/19/20.
//  Copyright © 2020 Andrés A. All rights reserved.
//

import UIKit
class ProductDetailPresenter {
    
    private let jsonParser = JSONParser()
    weak var viewController: ProductDetailViewController?
    
    func setImageToImageView(from urlImage: String?) {
        guard let urlImage = urlImage else {
            print("no url img")
            return
        }
        jsonParser.fetchImage(from: urlImage) { (imageData, error) in
            if let data = imageData {
                self.viewController?.showImage(image: data)
            } else {
                print("Error loading image!")
            }
        }
    }
    
    func openProductURL(url: String?){
        let urlString = url ?? "https://www.mercadolibre.com"
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
}



