//
//  PeopleViewModel.swift
//  
//
//  Created by pervın on 20.04.23.
//

import Foundation

class PeopleViewModel {
    
    var items = [PeopleResult]()
    var succesCallBack: (()->())?

    
    func getPopularPeople() {
        NetworkingManager.shared.request(model: People.self,
                                         url: NetworkHelper.shared.urlConfig(path: "person/popular")) { people, error in
            
            if let error = error {
                print("")
            } else if let people = people {
                self.items = people.result ?? []
//                self.category.append(Category(title: "Top Rated", items: moviedata.results ?? []))
                self.succesCallBack?()
            }
        }
    }
}
