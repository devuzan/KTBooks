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
    // MARK: - Life Cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    /// Injection ViewModel
    func configure(viewModel: BookListItemViewModelProtocol) {
        bookLabel.text = viewModel.name
    }
}
