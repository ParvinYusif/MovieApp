//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by pervın on 13.04.23.
//

import Foundation

struct Category {
    let title: String
    let items: [Result]
}

class HomeViewModel {
    
    var items = [Result]()
    
    var category = [Category]()
    
    var errorCallback: ((String)->())?
    var succesCallBack: (()->())?
    
    func getItems() {
        let items: [HomeCategory] = [.popular, .topRated, .upcoming, .nowPlaying]
        for item in items {
            getMovieItems(category: item)
        }
    }
    
    func getMovieItems(category: HomeCategory) {
        HomeManager.shared.getMovieItems(category: category) { movieData, error in
            if let error = error {
                self.errorCallback?(error)
            } else if let movieData = movieData {
                self.category.append(Category(title: category.rawValue.localize,
                                              items: movieData.results ?? []))
                self.succesCallBack?()
            }
            
        }
    }
//    func getPopularMovies() {
//        //        let apiKey = "e2253416fac0cd2476291eb33c92beb7"
//        NetworkingManager.shared.request(model: Movie.self,
//                                         url: NetworkHelper.shared.urlConfig(path: "movie/popular")) { moviedata, error in
//            if let error = error {
//                print("")
//            } else if let moviedata = moviedata {
//                //                self.items = moviedata.results ?? []
//                self.category.append(Category(title: "Popular", items: moviedata.results ?? []))
//                self.succesCallBack?()
//            }
//        }
//    }
//
//    func getTopRatedMovies() {
//        NetworkingManager.shared.request(model: Movie.self,
//                                         url: NetworkHelper.shared.urlConfig(path: "movie/top_rated")) { moviedata, error in
//
//            if let error = error {
//                print("")
//            } else if let moviedata = moviedata {
//                self.items = moviedata.results ?? []
//                self.category.append(Category(title: "Top Rated", items: moviedata.results ?? []))
//
//                self.succesCallBack?()
//            }
//        }
//    }
//    func getUpcaminMovies() {
//        NetworkingManager.shared.request(model: Movie.self,
//                                         url: NetworkHelper.shared.urlConfig(path: "movie/upcoming")) { moviedata, error in
//
//            if let error = error {
//                print("")
//            } else if let moviedata = moviedata {
//                self.items = moviedata.results ?? []
//                self.category.append(Category(title: "Upcoming", items: moviedata.results ?? []))
//
//                self.succesCallBack?()
//            }
//        }
//    }
//        func getNowplayinMovies() {
//            NetworkingManager.shared.request(model: Movie.self,
//                                             url: NetworkHelper.shared.urlConfig(path: "movie/nowPlaying")) { moviedata, error in
//    
//                if let error = error {
//                    print("")
//                } else if let moviedata = moviedata {
//                    self.items = moviedata.results ?? []
//                    self.category.append(Category(title: "nowPlaying", items: moviedata.results ?? []))
//    
//                    self.succesCallBack?()
//                }
//            }
//        }
}

