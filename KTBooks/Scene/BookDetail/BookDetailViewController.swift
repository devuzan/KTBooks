//
//  BookDetailViewController.swift
//  KTBooks
//
//  Created by pttem-ios on 28.09.2021.
//

import UIKit

/// BookDetailViewController
final class BookDetailViewController: UIViewController {
    // MARK: - Private Properties.
    private var viewModel: BookListItemViewModelProtocol!
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel.name)
    }
}

// MARK: - Build
extension BookDetailViewController {
    static func build(viewModel: BookListItemViewModelProtocol) -> BookDetailViewController {
        let sb = UIStoryboard(name: "BookDetail", bundle: nil)
        let viewController = sb.instantiateViewController(identifier: "BookDetailViewController") as! BookDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
