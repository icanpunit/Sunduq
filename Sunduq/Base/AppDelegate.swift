//
//  AppDelegate.swift
//  Sunduq
//
//  Created by Mandip Kanjiya on 18/07/18.
//  Copyright © 2018 Mandip Kanjiya. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var net:NetworkReachabilityManager = NetworkReachabilityManager()!
    var isLoadingViewVisible:Bool = false
    var deviceID = UIDevice.current.identifierForVendor?.uuidString
    var navLogin:UINavigationController! = nil
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = .lightContent
        IQKeyboardManager.shared.enable = true
        if (UserDefaults.standard.object(forKey: "nCustomerId") != nil)
        {
            self.loginSuccess()
        }
        else
        {
            //self.loginSuccess()
            self.logout()
        }
        return true
    }

    
    func loginSuccess()
    {
        navLogin = objMainScreen.instantiateViewController(withIdentifier: "NavMainScreen") as! UINavigationController
        
        //        navLogin = objSignupSB.instantiateViewController(withIdentifier: "KISignupNav") as! UINavigationController
        
        if self.window != nil {
            UIView.transition(with: self.window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                self.window!.rootViewController = self.navLogin
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
            })
        }
        
    }
    
    func logout()
    {
        navLogin = objMain.instantiateViewController(withIdentifier: "navLogin") as! UINavigationController
        
        //        navLogin = objSignupSB.instantiateViewController(withIdentifier: "KISignupNav") as! UINavigationController
        
        if self.window != nil {
            UIView.transition(with: self.window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                self.window!.rootViewController = self.navLogin
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
            })
        }
        
        
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

