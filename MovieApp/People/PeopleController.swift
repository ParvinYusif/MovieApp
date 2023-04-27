//
//  PeopleController.swift
//  MovieApp
//
//  Created by pervın on 20.04.23.
//

import UIKit

class PeopleController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = PeopleViewModel()
    let cellId = "\(TopImageButtomCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        collection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    func configureViewModel() {
        viewModel.getPopularPeople()
        viewModel.succesCallBack = {
            self.collection.reloadData()
        }
    }
}


extension PeopleController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath  ) as! TopImageButtomCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "DetailController") as! DetailController
        controller.detailModel.id = viewModel.items[indexPath.row].id
        navigationController?.show(controller, sender: nil)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2-10, height: 220)
    }
}
