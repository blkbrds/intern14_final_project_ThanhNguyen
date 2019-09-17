//
//  AppDelegate.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK: - Singleton
    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()

    enum ChangeRoot {
        case tabbar
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        configTabbar(root: .tabbar)
        return true
    }

    // MARK: - Config Tabbar
    func configTabbar(root: ChangeRoot) {
        switch root {
        case .tabbar:
            let homeViewController = HomeViewController()
            let homeNavigationController = UINavigationController(rootViewController: homeViewController)
            homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home"), selectedImage: #imageLiteral(resourceName: "ic-home-selected"))

            let searchViewController = SearchViewController()
            let searchNavigationController = UINavigationController(rootViewController: searchViewController)
            searchNavigationController.tabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "ic-search"), selectedImage: #imageLiteral(resourceName: "ic-search-selected"))

            let favoritesViewController = FavoritesViewController()
            let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
            favoritesNavigationController.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "ic-favorites"), selectedImage: #imageLiteral(resourceName: "ic-favorites-selected"))

            let viewControllers = [homeNavigationController, searchNavigationController, favoritesNavigationController]
            let tabbarController = UITabBarController()
            tabbarController.viewControllers = viewControllers

            window?.rootViewController = tabbarController
            window?.makeKeyAndVisible()
        }
    }

// MARK: - Application Life Cycle
    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
}
