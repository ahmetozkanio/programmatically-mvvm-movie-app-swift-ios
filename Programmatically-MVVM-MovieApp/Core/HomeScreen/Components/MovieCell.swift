//
//  MovieCell.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Özkan on 3.08.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseID = "MoviewCell"
    
    private var posterImageView: PosterImageView!
    var cellIndex: IndexPath?
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureCell()
        configurePosterImageView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("MovieCell prepareForReuse called!! \(cellIndex?.row ?? 0)")
        posterImageView.image = nil
        posterImageView.cancelDownloading()
    }
    
    func setCell(movie: MovieResult){
        posterImageView.downloadImage(movie: movie)
        print("MovieCell created!! \(cellIndex?.row ?? 0)")
    }
    
    private func configureCell(){
        backgroundColor = .systemGray6
        layer.cornerRadius = 16
        clipsToBounds = true // all subviews cornerRadius = 16 set
    }
    
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)

        
        
        posterImageView.backgroundColor = .red
        
        posterImageView.pinToEdgesOf(view: self)
    }
}
