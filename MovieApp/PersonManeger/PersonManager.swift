//
//  PersonManager.swift
//  MovieApp
//
//  Created by pervın on 25.04.23.
//

import Foundation

protocol PersonManagerProtocol {
    func getMovieItems(page: Int, category:PersonCategory , completion: @escaping((People?, String?)->()))
    func getPopularPeopleMovieList(id: Int, completion: @escaping ((Cast?, String?) -> ()))
}
class PersonManager {
    
    static var shared = PersonManager()
    
    func getMovieItems(page: Int, category:PersonCategory , completion: @escaping((People?, String?)->())){
        var url = ""
        switch category {
        case .popular:
            url = PersonEndpoint.popular.path + "&page=\(page)"

        }

        NetworkingManager.shared.request(model: People.self, url: url, complete: completion)
    }

    func getPopularPeopleMovieList(id: Int, completion: @escaping ((Cast?, String?) -> ())) {
        _ = "https://api.themoviedb.org/3/person/58021/movie_credits"

        NetworkingManager.shared.request(model: Cast.self, url: NetworkHelper.shared.urlConfig(path: "person/\(id)/movie_credits"), complete: completion)

    }
}



