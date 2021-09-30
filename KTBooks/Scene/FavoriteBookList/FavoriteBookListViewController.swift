//
//  FavoriteBookListViewController.swift
//  KTBooks
//
//  Created by pttem-ios on 29.09.2021.
//

import UIKit

final class FavoriteBookListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}


// MARK: - Build
extension FavoriteBookListViewController {
    static func build() -> FavoriteBookListViewController {
        let sb = UIStoryboard(name: "FavoriteBookList", bundle: nil)
        let viewController = sb.instantiateViewController(identifier: "FavoriteBookListViewController") as! FavoriteBookListViewController
        return viewController
    }
}
