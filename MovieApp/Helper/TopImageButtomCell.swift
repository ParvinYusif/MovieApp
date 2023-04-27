//
//  TopImageButtomCell.swift
//  MovieApp
//
//  Created by pervın on 19.04.23.
//

import UIKit

protocol TopImageButtomCellProtocol {
    
    var titleText: String { get }
    var imageUrl: String { get }
}


class TopImageButtomCell: UICollectionViewCell {

    @IBOutlet private weak var topImage: UIImageView!
    
    @IBOutlet private weak var titleLable: UILabel!
    
    override func layoutSubviews() {
        topImage.layer.cornerRadius = 20
    }
    
    func configure(data: TopImageButtomCellProtocol) {
        
        titleLable.text = data.titleText
        topImage.loadUrl(urlStr: data.imageUrl)
    }
//    func configure(data: PeopleResult) {
//        titleLable.text = data.name
//        topImage.loadUrl(urlStr: data.profilePath ?? "")
//    }
//
//    func configure(data: Result) {
//        titleLable.text = data.title
//        topImage.loadUrl(urlStr: data.posterPath ?? "")
//    }
//
}
