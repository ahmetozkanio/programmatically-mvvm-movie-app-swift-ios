//
//  HomeScreen.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Ozkan on 23.11.2022.
//

import UIKit

protocol HomeScreenProtocol: AnyObject{
    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
    func navigateToDetailScreen(movie: MovieResult)
}

final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
}

extension HomeScreen: HomeScreenProtocol{
 
    
   
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Movies"
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false // storyboard olmaz ise
         
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        
        collectionView.pinToEdgesOf(view: view)
    }
    
    func reloadCollectionView() {
        collectionView.reloadOnMainThread()
    }
    
    func navigateToDetailScreen(movie: MovieResult) {
        DispatchQueue.main.async {
            let detailScreen = DetailScreen(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
    

}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        
        cell.setCell(movie: viewModel.movies[indexPath.row])
        cell.cellIndex = indexPath
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getDetail(id: viewModel.movies[indexPath.item]._id)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
  
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Decelerating")
        
        let offsetY = scrollView.contentOffset.y
        let contentheigt = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentheigt - (height * 2){
            viewModel.getMovies()
        }
    }
  
}
    
