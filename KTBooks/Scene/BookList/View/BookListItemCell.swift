//
//  BookListItemCell.swift
//  KTBooks
//
//  Created by pttem-ios on 27.09.2021.
//

import UIKit

/// BookListItemCell
final class BookListItemCell: UICollectionViewCell {
    // MARK: - Public Properties.
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var bookFavoriteButton: UIButton!
    // MARK: - Life Cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    /// Injection ViewModel
    func configure(viewModel: BookListItemViewModelProtocol) {
        bookLabel.text = viewModel.name
        bookImageView.load(url: viewModel.artwork)
        guard let favoriteImageName = viewModel.getFavoriteImageName(), let favoriteImage = UIImage(named: favoriteImageName) else { return }
        bookFavoriteButton.setImage(favoriteImage, for: .normal)
    }
}
