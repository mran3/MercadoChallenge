//
//  UserDefaults+Favorite.swift

//
//  Created by Andres
//  Copyright © 2020 zourz. All rights reserved.
//

import Foundation

extension UserDefaults {
    static func addLiked(id: String){
        let defaults = UserDefaults.standard
        var currentFavs = defaults.object(forKey: "liked") as? [String] ?? [String]()
        
        if !currentFavs.contains(id){
            currentFavs.append(id)
            defaults.set(currentFavs, forKey: "liked")
        }
        
    }
    
    static func addDisLiked(id: String){
        let defaults = UserDefaults.standard
        var currentDisLiked = defaults.object(forKey: "disLiked") as? [String] ?? [String]()
        
        
        if !currentDisLiked.contains(id){
            currentDisLiked.append(id)
            defaults.set(currentDisLiked, forKey: "disLiked")
        }
        
    }

    
    
}
