//
//  MovieCell.swift
//  MovieApp
//
//  Created by pervın on 13.04.23.
//

import UIKit


class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func layoutSubviews() {
        posterImage.layer.cornerRadius = 20
    }

    func configure(data: Result) {
        titleLabel.text = data.title
//        let postBaseURL = "http://image.tmdb.org/t/p/original/"
//        let imageUrlString = postBaseURL + (data.posterPath ?? "")
        posterImage.loadUrl(urlStr: data.posterPath ?? "")
    }
}
