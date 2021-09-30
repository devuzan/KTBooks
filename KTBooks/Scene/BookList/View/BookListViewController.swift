//
//  BookListViewController.swift
//  KTBooks
//
//  Created by pttem-ios on 27.09.2021.
//

import UIKit

/// BookListViewController
final class BookListViewController: UIViewController {
    // MARK: - Private Properties.
    private var viewModel: BookListViewModelProtocol!
    // MARK: - Public Properties.
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getBookList { error in
            guard let error = error else {
                self.collectionView.reloadOnMainThread()
                return
            }
            self.showAlert(title: AppConstants.Text.errorTitle, message: error.localizedDescription, okActionHandler: nil)
        }
    }
    private func showBookDetail(with viewModel: BookListItemViewModelProtocol) {
        let viewController = BookDetailViewController.build(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension BookListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSecion(in: section)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookListItemCell", for: indexPath) as! BookListItemCell
        if let itemViewModel = viewModel.itemViewModel(at: indexPath) {
            cell.configure(viewModel: itemViewModel)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension BookListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let itemViewModel = viewModel.itemViewModel(at: indexPath) {
            showBookDetail(with: itemViewModel)
        }
    }
}

// MARK: - Build
extension BookListViewController {
    static func build() -> BookListViewController {
        let sb = UIStoryboard(name: AppConstants.StoryboardName.bookList, bundle: nil)
        let viewController = sb.instantiateViewController(identifier: "BookListViewController") as! BookListViewController
        let service = BookListService()
        let viewModel = BookListViewModel(service: service)
        viewController.viewModel = viewModel
        return viewController
    }
}
