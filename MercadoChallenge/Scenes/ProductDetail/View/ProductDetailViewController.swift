//
//  ProductDetailViewController.swift
//  MercadoChallenge
//
//  Created by troquer on 7/19/20.
//  Copyright © 2020 Andrés A. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var productData: Product?
    private var presenter = ProductDetailPresenter()

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var lblCondition: UILabel!
    @IBOutlet weak var lblUbicacion: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewOnWikipediaButton: UIButton!
    @IBOutlet weak var lblAvailable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewController = self
        guard productData != nil else {
            print("no product data")
            return
        }
        setup()
    }
    
    func hideIndicator(){
        DispatchQueue.main.async {
          self.activityIndicator.isHidden = true
        }
    }
    
    func showIndicator(){
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    func showImage(image: UIImage){
        DispatchQueue.main.async {
            self.hideIndicator()
            self.productImage.image = image
            self.productImage.contentMode = .scaleAspectFit
        }
    }
    
    func setup() {
        self.title = productData?.title
        lblPrice.text = productData?.formattedPrice()
        presenter.setImageToImageView(from: productData?.thumbnail)
        lblCondition.text = productData?.condition == "new" ? "Nuevo": "Usado"
        lblUbicacion.text = productData?.sellerAddress?.state?.name
        lblAvailable.text = String(productData?.availableQuantity ?? 0)
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        viewOnWikipediaButton.layer.cornerRadius = 10
        viewOnWikipediaButton.layer.borderWidth = 1
        viewOnWikipediaButton.layer.borderColor = UIColor.yellow.cgColor
    }
    
    @IBAction func viewOnWikipedia(_ sender: UIButton) {
        presenter.openProductURL(url: productData?.permalink)
    }
    
}
