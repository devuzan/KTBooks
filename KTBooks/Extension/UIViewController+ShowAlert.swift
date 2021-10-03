//
//  UIViewController+ShowAlert.swift
//  KTBooks
//
//  Created by pttem-ios on 28.09.2021.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, okActionHandler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: okActionHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func presentAlert(types: [BookListSortingType], tapped: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        types.forEach { type in
            let action = UIAlertAction(title: type.title, style: .default, handler: tapped)
            alertController.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
