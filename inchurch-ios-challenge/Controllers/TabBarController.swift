//
//  TabBarController.swift
//  inchurch-ios-challenge
//
//  Created by matela on 07/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewController = HomeViewController()
        firstViewController.tabBarItem = UITabBarItem(title: L10n.Home.title, image: Asset.icHome.image, tag: 0)
        
        let secondViewController = FavoritesViewController()
        secondViewController.tabBarItem = UITabBarItem(title: L10n.Favorites.title, image: Asset.icStar.image, tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
    
        self.viewControllers = tabBarList.map({ UINavigationController(rootViewController: $0) })
    }
}
