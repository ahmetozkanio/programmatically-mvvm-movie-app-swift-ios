//
//  HomeViewModel.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Ozkan on 24.11.2022.
//

import Foundation

protocol HomeViewModelProtocol{
    var view: HomeScreenProtocol? { get set }
    
    func viewDidLoad()
}

final class HomeViewModel{
    weak var view: HomeScreenProtocol?
    
}


extension HomeViewModel: HomeViewModelProtocol{

    func viewDidLoad(){
        view?.configureVC()
        view?.configureCollectionView()
    }
    
}
