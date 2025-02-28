//
//  AppDelegate.swift
//  inchurch-ios-challenge
//
//  Created by matela on 06/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import UIKit
import RealmSwift

let baseURL = "https://api.themoviedb.org/3"
let apiKey = "969c8429364a3270fe76ae86d6a3d6c9"
let imageBaseURL = "https://image.tmdb.org/t/p/original"
var uiRealm: Realm!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = TabBarController()
        
        self.migrateDatabase()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func migrateDatabase() {
        do {
            try uiRealm = Realm()
        } catch {
            uiRealm = try! Realm()
        }
        
        print("Documents: ", Realm.Configuration.defaultConfiguration.fileURL ?? "")
    }
    
}

