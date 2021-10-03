//
//  SearchBookListViewController.swift
//  KTBooks
//
//  Created by pttem-ios on 29.09.2021.
//

import UIKit

/// SearchBookListViewController
final class SearchBookListViewController: UIViewController {
    // MARK: - Public Properties.
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Private Properties.
    private var viewModel: SearchBookListViewModelProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getBookList { error in
            guard let error = error else {
                self.tableView.reloadOnMainThread()
                return
            }
            self.showAlert(title: AppConstants.Text.errorTitle, message: error.localizedDescription, okActionHandler: nil)
        }
    }
    private func setupTableView() {
        tableView.tableFooterView = UIView()
    }
}

// MARK: - UISearchBarDelegate
extension SearchBookListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterForSearchText(searchText) { [weak self] in
            self?.tableView.reloadOnMainThread()
        }
    }
}

// MARK: - UITableViewDataSource
extension SearchBookListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSecion(in: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBookListTableViewCell", for: indexPath) as! SearchBookListTableViewCell
        if let itemViewModel = viewModel.itemViewModel(at: indexPath) {
            cell.configure(viewModel: itemViewModel)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SearchBookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let itemViewModel = viewModel.itemViewModel(at: indexPath) {
            navigationController?.pushViewController(BookDetailViewController.build(viewModel: itemViewModel), animated: true)
        }
    }
}


// MARK: - Build
extension SearchBookListViewController {
    static func build() -> SearchBookListViewController {
        let sb = UIStoryboard(name: "SearchBookList", bundle: nil)
        let viewController = sb.instantiateViewController(identifier: "SearchBookListViewController") as! SearchBookListViewController
        let service = BookListService()
        let viewModel = SearchBookListViewModel(service: service)
        viewController.viewModel = viewModel
        viewController.title = AppConstants.Title.searchBookList
        return viewController
    }
}
