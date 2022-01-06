//
//  AppDelegate.swift
//  employees
//
//  Created by juan ledesma on 14/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var touchDetector: TouchDetector?
    var backgroundStateDetector: BackgroundStateDetector?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        touchDetector = TouchDetector()
        backgroundStateDetector = BackgroundStateDetector()

        self.window = UIWindow()
        
        if let window = self.window {
            let router = MainRouter(window: window)
            router.presentMainViewController()
        }

        return true
    }

    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
}
