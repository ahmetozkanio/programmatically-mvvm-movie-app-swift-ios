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
    func getMovies()
}

final class HomeViewModel{
    weak var view: HomeScreenProtocol?
    private let service = MovieService()
    var movies: [MovieResult] = []
}


extension HomeViewModel: HomeViewModelProtocol{

    func viewDidLoad(){
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    func getMovies() {
        service.downloadMovies { [weak self] result in
            guard let self = self else { return }
            guard let result = result else { return }
            
            self.movies = result
            print(self.movies)
        }
    }
}
