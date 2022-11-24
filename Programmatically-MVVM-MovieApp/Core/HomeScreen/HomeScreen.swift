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
        
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false // storyboard olmaz ise
         
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        collectionView.backgroundColor = .yellow
    }
    
}
