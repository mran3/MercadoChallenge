//
//  DetailBreedPresenter.swift
//  Felinos
//
//  Copyright © 2020 Andrés A. All rights reserved.
//

import Foundation

class ListBreedsPresenter {
    
    private var breedDetail: BreedDetail?
    private let apiConfig = APIConfig()
    private let jsonParser = JSONParser()
    weak var viewController: BreedsTableViewController?

    func getBreeds() {
        let jsonURL = apiConfig.fetchURL(with: .breeds, parameters: ["x_api_key" : apiConfig.apiKey])
      
        jsonParser.downloadData(of: Breed.self, from: jsonURL!) { [weak self] (result)
            in
            guard let self = self else { return }

               switch result {
               case .failure(let error):
                   if error is DataError {
                       print("DataError = \(error)")
                   } else {
                       print(error.localizedDescription)
                   }
               case .success(let breeds):
                BreedService.breeds = breeds                
                self.viewController?.breedsLoaded()
               }
               
           }
    }
    

    
}


