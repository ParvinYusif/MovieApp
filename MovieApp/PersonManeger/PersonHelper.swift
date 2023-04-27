//
//  PersonHelper.swift
//  MovieApp
//
//  Created by pervın on 25.04.23.
//

import Foundation

enum PersonCategory:String {
    case popular = "Popular Person"
    
}

enum PersonEndpoint: String {
    case popular = "person/popular"
   
    var path:String {
        NetworkHelper.shared.urlConfig(path: self.rawValue)
    }
}
