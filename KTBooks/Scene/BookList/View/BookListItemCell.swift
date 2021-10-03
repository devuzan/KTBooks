//
//  BookListItemCell.swift
//  KTBooks
//
//  Created by pttem-ios on 27.09.2021.
//

import UIKit

/// BookListItemCell
final class BookListItemCell: UICollectionViewCell {
    var viewModel: BookListItemViewModelProtocol! {
        didSet {
            bookLabel.text = viewModel.name
            bookImageView.load(url: viewModel.artwork)
            updateFavoriteButtonImage(imageName: viewModel.imageName)
        }
    }
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
        self.viewModel = viewModel
    }
    @IBAction func tappedFavoriteButton(_ sender: Any) {
        let isFavorited = viewModel.isFavoritedBook()
        viewModel.updateFavoriteBook(isFavorited: !isFavorited)
        updateFavoriteButtonImage(imageName: viewModel.imageName)
    }
    private func updateFavoriteButtonImage(imageName: String?) {
        if let imageName = imageName {
            bookFavoriteButton.setImage(UIImage(named: imageName), for: .normal)
        }
    }
}
