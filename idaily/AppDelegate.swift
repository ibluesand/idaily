//
//  AppDelegate.swift
//  idaily
//
//  Created by bluesand on 9/19/15.
//  Copyright © 2015 Bluesand. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let launchImageUrl = "http://news-at.zhihu.com/api/4/start-image/720*1184"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var testNavigationController: UINavigationController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        testNavigationController = UINavigationController()
    
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.blueColor()
        self.window!.makeKeyAndVisible()
        
        let image = UIImage()
        
        self.window!.rootViewController =
        LaunchImageViewController.addTransitionToViewController(testNavigationController!, modalTransitionStyle: UIModalTransitionStyle.CrossDissolve, withImageDate: image, withSourceName: "hello")

        loadStartImage(launchImageUrl);
        

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func loadStartImage(url:String) {
        Alamofire.request(.GET, launchImageUrl).responseJSON() {
                (request, response, result) in
                var json  = JSON(result.value!)
                let img = json["img"]
                print(img)
        }
    }


}

