//
//  UINavigation+Build.swift
//  KTBooks
//
//  Created by pttem-ios on 4.10.2021.
//

import UIKit

extension UINavigationController {
    static func build(tabType: TabType) -> UINavigationController {
        let sb = UIStoryboard(name: tabType.name, bundle: nil)
        let navigationController = sb.instantiateViewController(identifier: tabType.identifier) as! UINavigationController
        navigationController.tabBarItem.title = tabType.title
        navigationController.tabBarItem.image = tabType.image
        navigationController.viewControllers = [tabType.viewController]
        return navigationController
    }
}
