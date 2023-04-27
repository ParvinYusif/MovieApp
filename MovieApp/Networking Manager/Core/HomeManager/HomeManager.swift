//
//  HomeManager.swift
//  MovieApp
//
//  Created by pervın on 20.04.23.
//

import Foundation

class HomeManager {
    static let shared = HomeManager()

    func getMovieItems(category: HomeCategory, complete: @escaping((Movie?, String?)->())) {
        var url = ""
        switch category {
        case .popular:
            url =  HomeEndpoint.popular.path
        case .topRated:
            url = HomeEndpoint.topRated.path
        case .upcoming:
            url = HomeEndpoint.upcoming.path
        case .nowPlaying:
            url = HomeEndpoint.nowPlaying.path
        }
        NetworkingManager.shared.request(model: Movie.self,
                                         url: url,
                                         complete: complete)
    }
}
