//
//  LikePresenter.swift
//  Felinos
//
//  Copyright © 2020 Andrés A. All rights reserved.
//

import Foundation
class LikePresenter {
    private let apiConfig = APIConfig()
    private let jsonParser = JSONParser()
    weak var viewController: LikeViewController?
    var imagesCats = [ImageCAT]()
    var cardImagesURLs:[URL] = []
    
    func getImagesForVotes() {
        
        let jsonURL = apiConfig.fetchURL(with: .images, parameters:
            ["x_api_key" : apiConfig.apiKey,
             "limit" : "10"])
        
        jsonParser.downloadData(of: ImageCAT.self, from: jsonURL!) {[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                if error is DataError {
                    print("DataError = \(error)")
                } else {
                    print(error.localizedDescription)
                }
                self.viewController?.hideIndicator()
            case .success(let imagesCats):
                self.imagesCats = imagesCats
                self.cardImagesURLs = self.imagesCats.map({URL(string: $0.url)!})
                print("imgs loaded")
                self.viewController?.downloadImgsFromURLs()
            }
            
            
        }
    }
    
    
}
