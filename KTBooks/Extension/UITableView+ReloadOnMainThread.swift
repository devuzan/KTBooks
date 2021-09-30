//
//  UITableView+ReloadOnMainThread.swift
//  KTBooks
//
//  Created by pttem-ios on 30.09.2021.
//

import UIKit

extension UITableView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

