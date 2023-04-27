//
//  HomeCell.swift
//  MovieApp
//
//  Created by pervın on 13.04.23.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    @IBOutlet private weak var labelText: UILabel!
    
    
    private var movieItems = [Result]()

    let cellId = "\(TopImageButtomCell.self)"

    func configure(data: Category) {
        movieItems = data.items
        labelText.text = data.title
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        collection.reloadData()
    }
}

extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopImageButtomCell
        cell.configure(data: movieItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: 272)
    }
}
