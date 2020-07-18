//
//  DetailBreedViewController.swift
//  Felinos
//
//  Created by Andrés A.
//  Copyright © 2020 Andrés A.. All rights reserved.
//

import UIKit

class DetailBreedViewController: UIViewController {
    var dataBreed = Breed()
    private var presenter = DetailBreedPresenter()

    @IBOutlet weak var imageBreed: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var lblTemperament: UILabel!
    @IBOutlet weak var lblLifeSpan: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewOnWikipediaButton: UIButton!
    
    weak var delegate: BreedsTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewController = self
        presenter.getBreedDetail(from: dataBreed.id)
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
            self.imageBreed.image = image
            self.imageBreed.contentMode = .scaleAspectFit
        }
    }
    
    func setup() {
        self.title = dataBreed.name
        lblTemperament.text = dataBreed.temperament
        lblLifeSpan.text = dataBreed.lifeSpan
        descriptionTextView.text = dataBreed.description
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        viewOnWikipediaButton.layer.cornerRadius = 10
        viewOnWikipediaButton.layer.borderWidth = 1
        viewOnWikipediaButton.layer.borderColor = UIColor.yellow.cgColor
    }
    
    @IBAction func viewOnWikipedia(_ sender: UIButton) {
        presenter.openBreedURL(url: dataBreed.wikipediaUrl)
    }
    
}
