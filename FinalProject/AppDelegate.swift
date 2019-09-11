//
//  AppDelegate.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Propeties
    var window: UIWindow?

    // MARK: - Singleton
    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()

    enum ViewController {
        case tabbar
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        configTabbar(controller: .tabbar)
//        setDefaultRealmForUser()

        return true
    }

//    func setDefaultRealmForUser() {
//        let config = Realm.Configuration()
//        // Set this as the configuration used for the default Realm
//        Realm.Configuration.defaultConfiguration = config
//    }

    // MARK: Config Tabbar Controller
    func configTabbar(controller: ViewController) {
        switch controller {
        case .tabbar:
            // Home
            let homeViewController = HomeViewController()
            let homeNavigationController = UINavigationController(rootViewController: homeViewController)
            homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ic-home"), selectedImage: #imageLiteral(resourceName: "ic-home-selected"))

            // Search
            let searchViewController = SearchViewController()
            let searchNavigationController = UINavigationController(rootViewController: searchViewController)
            searchNavigationController.tabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "ic-search"), selectedImage: #imageLiteral(resourceName: "ic-search-selected"))

            // Favorites
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

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
}
