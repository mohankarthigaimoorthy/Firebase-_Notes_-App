//
//  TabBar.swift
//  crashNotes
//
//  Created by Mohan K on 11/04/23.
//

import Foundation
import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupViewControllers()
        
    }
    
    func setupViewControllers() {
        viewControllers = [
            generateNavigationController(for: ListViewController(), title: "users", image: UIImage(systemName: "safari")!),
            generateNavigationController(for: profileViewController(), title: "profile", image: UIImage(systemName: "person")!)
            ]
    }
            fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
                let navController = UINavigationController(rootViewController: rootViewController)
                navController.navigationBar.prefersLargeTitles = true
                rootViewController.navigationItem.title = title
                navController.tabBarItem.title = title
                navController.tabBarItem.image = image
                return navController
            }
}
