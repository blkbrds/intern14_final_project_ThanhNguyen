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
import GoogleMaps

let googleApiKey = "AIzaSyDIJ9UssMoN9IfR9KnTc4lb3B9NtHpRF-c"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Propeties
    var window: UIWindow?
    lazy var locationManager = CLLocationManager()
    typealias Action = (String?, (() -> Void)?)

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

        GMSServices.provideAPIKey(googleApiKey)
        return true
    }

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

            let mapViewController = MapViewController()
            let mapNavigationController = UINavigationController(rootViewController: mapViewController)
            mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: #imageLiteral(resourceName: "ic-map"), selectedImage: #imageLiteral(resourceName: "ic-map-selected"))

            let viewControllers = [homeNavigationController, searchNavigationController, favoritesNavigationController, mapNavigationController]
            let tabbarController = UITabBarController()
            tabbarController.viewControllers = viewControllers

            window?.rootViewController = tabbarController
            window?.makeKeyAndVisible()
        }
    }

    func showAlert(title: String, message: String, actions: [Action]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            if let handler = action.1 {
                let alertAction = UIAlertAction(title: action.0, style: .default, handler: { (_) in
                    handler()
                })
                alert.addAction(alertAction)
            } else {
                let alertAction = UIAlertAction(title: action.0, style: .default, handler: nil)
                alert.addAction(alertAction)
            }
        }
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    func configLocationService() {
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            enableLocationServices()
            startStandardLocationService()
        case .denied:
            let title = "Request location service"
            let message = "Please go to Setting > Privacy > Location service to turn on location service for \"Map Demo\""
            let action: Action = ("OK", nil)
            showAlert(title: title, message: message, actions: [action])
        case .restricted:
            break
        @unknown default:
            fatalError()
        }
    }
    
    func enableLocationServices() {
        CLLocationManager.locationServicesEnabled()
    }

    func startStandardLocationService() {
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
    }

    func stopStandardLocationService() {
        locationManager.stopUpdatingLocation()
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
}

extension AppDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .denied:
            stopStandardLocationService()
        case .authorizedWhenInUse, .authorizedAlways:
            enableLocationServices()
            startStandardLocationService()
        case .notDetermined:
            break
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        print("timestampe \(lastLocation.timestamp)")
        print("lat \(lastLocation.coordinate.latitude)")
        print("lng \(lastLocation.coordinate.longitude)")
    }
}
