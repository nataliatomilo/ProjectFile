//
//  SceneDelegate.swift
//  BeautyPlace
//
//  Created by Наталья Томило on 19.05.22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FBSDKCoreKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let wc = scene as? UIWindowScene {
            let myWindow = UIWindow(windowScene: wc)
            let navContr = UINavigationController()
            let signInVC = SignInAndSignUpViewController()
            let startVC = StartListViewController()
            navContr.viewControllers = [signInVC]
            myWindow.rootViewController = navContr
            window = myWindow
            myWindow.makeKeyAndVisible()
            
            
        }
//        guard let _ = (scene as? UIWindowScene) else { return }
//        if UserDefaults.standard.string(forKey: "username") != nil {
//            let tabBarVC = TabBarViewController()
//            window?.rootViewController = tabBarVC
//        } else {
//            let signInVC = SignInAndSignUpViewController()
//            window?.rootViewController = signInVC
//        }
   }
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
//        guard let window = self.window else {
//           return
//       }
//        window.rootViewController = vc
//        UIView.transition(with: window,
//                          duration: 0.5,
//                          options: [.allowAnimatedContent],
//                          animations: nil,
//                          completion: nil)
        
}
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}

