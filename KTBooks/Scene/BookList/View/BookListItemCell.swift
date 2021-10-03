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
        if let imageName = viewModel.imageName {
            bookFavoriteButton.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    @IBAction func tappedFavoriteButton(_ sender: Any) {
        let isFavorited = viewModel.isFavoritedBook()
        viewModel.updateFavoriteBook(isFavorited: !isFavorited)
        bookFavoriteButton.setImage(UIImage(named: viewModel.imageName!), for: .normal)
    }
}
