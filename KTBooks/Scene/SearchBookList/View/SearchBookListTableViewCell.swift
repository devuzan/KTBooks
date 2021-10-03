//
//  SearchBookListTableViewCell.swift
//  KTBooks
//
//  Created by pttem-ios on 1.10.2021.
//

import UIKit

/// SearchBookListTableViewCell
final class SearchBookListTableViewCell: UITableViewCell {
    // MARK: - Public Properties.
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookReleaseLabel: UILabel!
    @IBOutlet weak var bookArtistName: UILabel!
    // MARK: - Initializer Methods.
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    /// Injection ViewModel
    func configure(viewModel: BookListItemViewModelProtocol) {
        bookTitleLabel.text = viewModel.name
        bookImageView.load(url: viewModel.artwork)
        bookReleaseLabel.text = viewModel.releaseDate
        bookArtistName.text = viewModel.artistName
    }
}
