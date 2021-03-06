//
//  MainViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//
import UIKit
import SwiftUI

class MainViewController: UITabBarController, UITabBarControllerDelegate {
    
    static let userFeedIndex = 0
    static let searchPageIndex = 1
    static let galleryPageIndex = 2
    static let likePageIndex = 3
    static let myAccountPageIndex = 4
    var injectiveView: UIView?
    
    init(injectiveView: UIView? = nil) {
        self.injectiveView = injectiveView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupNavigationBar()
        
        selectedIndex = MainViewController.userFeedIndex
        delegate = self
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
    }

    private func setupViewControllers() {
        viewControllers = [
            getHomePageController(),
            getSearchPageController(),
            getGalleryPageController(),
            getLikePageController(),
            getAccountPageController()
        ]
        
        selectedViewController = viewControllers?.first ?? getHomePageController()
    }

    private func getHomePageController() -> UINavigationController {
        let navController = UINavigationController(rootViewController: FeedVC())
        navController.tabBarItem = UITabBarItem(title: "Feed",
                                                image: UIImage(named: "earth-america-7")?.withRenderingMode(.alwaysOriginal),
                                                selectedImage: UIImage(named: "earth-america-7")?.withRenderingMode(.alwaysOriginal))
        return navController
    }
    
    private func getSearchPageController() -> UIViewController {
        let navController = UINavigationController(rootViewController: VC1())
        navController.tabBarItem = UITabBarItem(title: "Search",
                                                image: UIImage(named: "search-7")?.withRenderingMode(.alwaysOriginal),
                                                selectedImage: UIImage(named: "search-7")?.withRenderingMode(.alwaysOriginal))
        return navController
    }
    
    private func getGalleryPageController() -> UIViewController {
        let navController = UINavigationController(rootViewController: VC2())
        navController.tabBarItem = UITabBarItem(title: "Gallery",
                                                image: UIImage(named: "origami-7")?.withRenderingMode(.alwaysOriginal),
                                                selectedImage: UIImage(named: "origami-7")?.withRenderingMode(.alwaysOriginal))
        return navController
    }
    
    private func getLikePageController() -> UIViewController {
        var navController = UINavigationController()
        if #available(iOS 13.0, *) {
            let contentView = DemoSwiftUIView()
            let host = UIHostingController(rootView: contentView)
            navController = UINavigationController(rootViewController: host)
        } else {
            navController = UINavigationController(rootViewController: BoxViewController())
        }
        navController.tabBarItem = UITabBarItem(title: "Likes",
                                                image: UIImage(named: "thumb-up-7")?.withRenderingMode(.alwaysOriginal),
                                                selectedImage: UIImage(named: "thumb-up-7")?.withRenderingMode(.alwaysOriginal))
        return navController
    }
    
    private func getAccountPageController() -> UIViewController {
        var navController = UINavigationController()
        if #available(iOS 13.0, *) {
            let host = MyAccountHostViewController()
            navController = UINavigationController(rootViewController: host)
            navController.navigationBar.isHidden = true
        } else {
            navController = UINavigationController(rootViewController: SegmentedPageViewController())
        }
        navController.tabBarItem = UITabBarItem(title: "MyAccount",
                                                image: UIImage(named: "circle-user-7")?.withRenderingMode(.alwaysOriginal),
                                                selectedImage: UIImage(named: "circle-user-7")?.withRenderingMode(.alwaysOriginal))
        return navController
    }

}
