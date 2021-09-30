//
//  AppRouter.swift
//  KTBooks
//
//  Created by pttem-ios on 27.09.2021.
//

import UIKit

/// App Router
final class AppRouter {
    // MARK: - Private Properties.
    private let window: UIWindow
    // MARK: - Initializer Methods.
    init() {
        window = UIWindow()
        window.makeKeyAndVisible()
    }
    // MARK: - Show Movie List
    func start() {
        let navigationController = UINavigationController(rootViewController: BookListViewController.build())
        window.rootViewController = navigationController
    }
}
