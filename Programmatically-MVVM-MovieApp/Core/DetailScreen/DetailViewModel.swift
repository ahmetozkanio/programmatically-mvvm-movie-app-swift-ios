//
//  DetailViewModel.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Özkan on 4.08.2023.
//

import Foundation

protocol DetailViewModelProtocol {
    
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailScreenProtocol?
}

extension DetailViewModel: DetailViewModelProtocol {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
    
    
    
}
