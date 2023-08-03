//
//  UIHelper.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Özkan on 3.08.2023.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        
        let itemWidth = CGFloat.deviceWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 40
        
        
        return layout
        
    }
}
