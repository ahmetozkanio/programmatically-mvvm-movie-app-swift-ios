//
//  DetailScreen.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Özkan on 4.08.2023.
//

import UIKit

class DetailScreen: UIViewController {

    let movie: MovieResult
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }


}
