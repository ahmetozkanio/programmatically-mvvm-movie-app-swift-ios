//
//  MovieCell.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Özkan on 3.08.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseID = "MoviewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureCell(){
        backgroundColor = .systemGray6
        layer.cornerRadius = 16
    }
}
