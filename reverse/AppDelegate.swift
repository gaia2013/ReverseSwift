//
//  AppDelegate.swift
//  reverse
//
//  Created by 山口仁志 on 2018/08/12.
//  Copyright © 2018年 reverse014.jp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?


    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        // viewControllerを生成する
        let myViewController = ViewController()
        
        // navigationControllerを生成
        let navigationController = UINavigationController(rootViewController: myViewController)
        
        // windowを生成
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // rootViewControllerにnavigationControllerを設定
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        // return true
    }

}

