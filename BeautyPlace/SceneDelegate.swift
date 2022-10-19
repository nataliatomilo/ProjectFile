
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
            navContr.viewControllers = [signInVC]
            myWindow.rootViewController = navContr
            window = myWindow
            myWindow.makeKeyAndVisible()
        }
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
