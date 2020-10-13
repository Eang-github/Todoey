//
//  AppDelegate.swift
//  Todoey
//
//  Created by Mengeang CHENG on 10/13/20.
//  Copyright © 2020 Mengeang CHENG. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController  = UINavigationController(rootViewController: TodoListViewController())
        window?.makeKeyAndVisible()
        
        return true
    }


}

