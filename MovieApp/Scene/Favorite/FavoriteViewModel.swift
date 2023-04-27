//
//  FavoriteViewModel.swift
//  MovieApp
//
//  Created by pervın on 13.04.23.
//

import Foundation

class FavoriteViewModel {
    
    let apiKey = "e2253416fac0cd2476291eb33c92beb7"
    
    func getFavoriteMovies() {
        NetworkingManager.shared.request(model: String.self,
                                         url: "favorite?api_key\(apiKey)") { data , error in
            
        }
    }
}
