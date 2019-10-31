//
//  AppDelegate.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/11.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        changeNavigationBarColor()
        
        if let _ = Auth.auth().currentUser {
            let storyboard:UIStoryboard =  UIStoryboard(name: "Main",bundle:nil)
            window?.rootViewController
                = storyboard.instantiateViewController(withIdentifier: "TabView")
        }
        return true
    }
    
    func changeNavigationBarColor() {
        UINavigationBar.appearance().barTintColor = SettingColor.primary
        UINavigationBar.appearance().tintColor = SettingColor.secondary
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: SettingColor.background]
    }
}
