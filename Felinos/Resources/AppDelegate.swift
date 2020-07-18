//
//  AppDelegate.swift
//  Felinos
//
//  Created by Andrés A. on 5/3/20.
//  Copyright © 2020 Andrés A.. All rights reserved.

import UIKit

var AppInstance: AppDelegate!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppInstance = self
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = UIColor.orange
        
        
        UINavigationBar.appearance().barTintColor = Color.condorYellow
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().isTranslucent = false
        
        UITabBarItem.appearance().setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        return true
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }


}

