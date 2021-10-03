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

    private var isFavorited: Bool = false {
        didSet {
            customRightBarButtonItem.setImage(UIImage(named: isFavorited ? "ICON-favorited" : "ICON-favorite"), for: .normal)
        }
    }
    private var customRightBarButtonItem: UIButton!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookArtistName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    private var viewModel: BookListItemViewModelProtocol!
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightNavigationBar()
        configureViews()
    }
    private func configureViews() {
        bookImageView.load(url: viewModel.artwork)
        bookName.text = viewModel.name
        bookArtistName.text = viewModel.artistName
        releaseDate.text = viewModel.releaseDate
        isFavorited = viewModel.isFavoritedBook()
    }
    private func setupRightNavigationBar() {
        customRightBarButtonItem = UIButton(type: .custom)
        customRightBarButtonItem.addTarget(self, action: #selector(tappedFavoriteButton), for: .touchUpInside)
        let rightBarButtonItem = UIBarButtonItem(customView: customRightBarButtonItem)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    @objc private func tappedFavoriteButton() {
        viewModel.updateFavoriteBook(isFavorited: !isFavorited)
        isFavorited = !isFavorited
    }
    private func updateRightBarButtonImage(isFavorited: Bool) -> UIImage? {
        UIImage(named: isFavorited ? "" : "ICON-favorite")
    }
}

// MARK: - Build
extension BookDetailViewController {
    static func build(viewModel: BookListItemViewModelProtocol) -> BookDetailViewController {
        let sb = UIStoryboard(name: "BookDetail", bundle: nil)
        let viewController = sb.instantiateViewController(identifier: "BookDetailViewController") as! BookDetailViewController
        viewController.viewModel = viewModel
        viewController.title = viewModel.name
        return viewController
    }
}
