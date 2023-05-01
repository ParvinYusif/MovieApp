//
//  HomeController.swift
//  MovieApp
//
//  Created by pervın on 13.04.23.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.showsVerticalScrollIndicator = false
        title = "Movie"
        configViewModel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configueUI()
    }
    
    func configViewModel() {
        viewModel.getMovieItems(category: .popular)
        viewModel.getMovieItems(category: .topRated)
        viewModel.getMovieItems(category: .upcoming)
        
        //        viewModel.getPopularMovies()
        //        viewModel.getTopRatedMovies()
        //        viewModel.getUpcaminMovies()
       //         viewModel.getNowplayinMovies()
        viewModel.succesCallBack = {
            self.collection.reloadData()
        }
        viewModel.errorCallback = { message in
            self.showAlert(title: "Error", message: "Uyari", buttonText: "OKEY" )
        }
        
    }
    
    func showAlert(title: String, message: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonText, style: .default, handler: nil)
        alert.addAction(okAction)
        
    }
    
    func configueUI() {
        let lang = UserDefaults.standard.string(forKey: "applang")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj") ?? ""
        let bundle = Bundle(path: path) ?? Bundle()
        titleLabel.text = "home_title".localize
        collection.reloadData()
//        titleLabel.text = NSLocalizedString("home_title", comment: "")
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        cell.configure(data: viewModel.category[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 318)
    }
}
