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
         
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.pinToEdgesOf(view: view)
    }
    
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
  
}
    
