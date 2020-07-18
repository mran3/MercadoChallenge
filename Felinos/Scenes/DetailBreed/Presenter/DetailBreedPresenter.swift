//
//  DetailBreedPresenter.swift
//  Felinos
//
//  Copyright © 2020 Andrés A. All rights reserved.
//

import UIKit
class DetailBreedPresenter {
    
    private var breedDetail: BreedDetail?
    private let apiConfig = APIConfig()
    private let jsonParser = JSONParser()
    weak var viewController: DetailBreedViewController?

    func getBreedDetail(from breedID: String?) {
        let jsonURL = apiConfig.fetchURL(with: .images, parameters: [apiConfig.breed_ids: breedID!])
        
        jsonParser.downloadData(of: BreedDetail.self, from: jsonURL!) {[weak self] (result) in
            guard let self = self else { return }

            switch result {
            case .failure(let error):
                if error is DataError {
                    print("DataError = \(error)")
                } else {
                    print(error.localizedDescription)
                }
            case .success(let breedDetail):
                self.viewController?.showIndicator()
                self.breedDetail = breedDetail[0]
                self.setImageToImageView(from: (self.breedDetail?.url)!)
            }
        }
    }
    
    func setImageToImageView(from urlImage: String) {
        jsonParser.fetchImage(from: urlImage) { (imageData, error) in
            if let data = imageData {
                self.viewController?.hideIndicator()
                self.viewController?.showImage(image: data)
            } else {
                print("Error loading image!")
            }
        }
    }
    
    func openBreedURL(url: String?){
        let urlString = url ?? "https://en.wikipedia.org/wiki/List_of_cat_breeds"
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
    
}


