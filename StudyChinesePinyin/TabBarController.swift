//
//  TabBarController.swift
//  StudyChinesePinyin
//
//  Created by KAZUMA NOHA on 2019/10/13.
//  Copyright © 2019 KAZUMA NOHA. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = SettingColor.secondary
        UITabBar.appearance().barTintColor = SettingColor.primary
        
        // Do any additional setup after loading the view.
    }
}
