//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by serhat on 27.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = createTabbar()
        
        
        func createTabbar() -> UITabBarController{
            let tabBar =    UITabBarController()
            tabBar.viewControllers = [createCharacterNV(),createEpisodeNV()]
            UITabBar.appearance().tintColor = .systemGreen
            UITabBar.appearance().backgroundColor = .systemGray6
            return tabBar
        }
        
        func createCharacterNV()-> UINavigationController{
            let characterVC = CharacterVC()
            characterVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.fill"), tag: 0)
            let navBar = UINavigationController(rootViewController: characterVC)
            let navAppearance = UINavigationBarAppearance()
            navAppearance.backgroundColor = .systemGray6
            navBar.navigationBar.standardAppearance = navAppearance
            navBar.navigationBar.scrollEdgeAppearance = navAppearance
            return navBar
        }
        
        func createEpisodeNV()-> UINavigationController{
            let episodeVC = EpisodeVC()
            episodeVC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "book"), tag: 0)
            let navBar = UINavigationController(rootViewController: episodeVC)
            let navAppearance = UINavigationBarAppearance()
            navAppearance.backgroundColor = .systemGray6
            navBar.navigationBar.standardAppearance = navAppearance
            navBar.navigationBar.scrollEdgeAppearance = navAppearance
            return navBar
        }
        
        
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


}

