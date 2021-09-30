//
//  UICollectionView+ReloadOnMainThread.swift
//  KTBooks
//
//  Created by pttem-ios on 28.09.2021.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

