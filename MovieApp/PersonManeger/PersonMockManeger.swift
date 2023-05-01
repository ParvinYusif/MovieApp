//
//  PersonMockManeger.swift
//  MovieApp
//
//  Created by pervın on 28.04.23.
//

import Foundation

//class PersonMockManeger: PersonManagerProtocol {
//    static let shared = PersonManager()
//    
//    func getMovieItems(category: PersonCategory, completion: @escaping ((People?, String?) -> ())) {
//        if let file = Bundle.main.url(forResource: "PopularPeople", withExtension: "json"),
//           let data = try? Data(contentsOf: file) {
//            do {
//                let people = try JSONDecoder().decode(People.self, from: data)
//                completion(people, nil)
//            } catch {
//                completion(nil, error.localizedDescription)
//            }
//        }
//    }
//        func getPopularPeopleMovieList(id: Int, completion: @escaping ((Cast?, String?) -> ())) {
//            
//        }
//    }
//
