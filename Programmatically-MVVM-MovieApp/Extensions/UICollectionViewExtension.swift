//
//  UICollectionViewExtension.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Özkan on 4.08.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
