//
//  String + Excition.swift
//  MovieApp
//
//  Created by pervın on 01.05.23.
//

import Foundation

extension String {
    var localize: String {
        let lang = UserDefaults.standard.string(forKey: "applang")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj") ?? ""
        let bundle = Bundle(path: path) ?? Bundle()
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
