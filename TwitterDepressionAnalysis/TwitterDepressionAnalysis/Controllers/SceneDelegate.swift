//
//  SceneDelegate.swift
//  TwitterDepressionAnalysis
//
//  Created by Ashley Raigosa on 7/12/20.
//  Copyright © 2020 Ashley Raigosa. All rights reserved.
//

import UIKit
import SwiftUI


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let twitterKeys = TwitterService()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      // Create the SwiftUI view that provides the window contents.
        let twitter = TwitterService()
        let displayView = DisplayView()
        
        let contentView = LoginView().environmentObject(twitter)
            .environmentObject(displayView)
      // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
      }
    }
    
    // URL Scheme for Twitter Login
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
      
         handleOpenUrl(notificationName: .twitterCallback,
                       callbackScheme: twitterKeys.TWITTER_SDK,
         url: URLContexts.first?.url)
    }
    
    func handleOpenUrl(notificationName: Notification.Name,
                       callbackScheme scheme: String, url: URL?) {
        // First, verify that the url scheme received matches our callback URL scheme
        guard let url = url,
              let urlScheme = url.scheme,
              let callbackUrl = URL(string: "\(scheme)://"),
              let callbackScheme = callbackUrl.scheme
        else { return }
        guard urlScheme.caseInsensitiveCompare(callbackScheme) == .orderedSame else { return }
        // If the schemes match, we will include the URL in a the object of the notification and Post
        let notification = Notification(name: notificationName,object: url, userInfo: nil)
        NotificationCenter.default.post(notification)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

