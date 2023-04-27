//
//  ImageHelper.swift
//  MovieApp
//
//  Created by pervın on 14.04.23.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func loadUrl(urlStr: String) {
        let posterBaseURL = "https://image.tmdb.org/t/p/original/"
        if let url =  URL(string: posterBaseURL + urlStr) {
            self.sd_setImage(with: url)
        }
    }
}
