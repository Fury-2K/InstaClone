//
//  UserAccountViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 14/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class UserAccountViewController: UIViewController {

    @IBOutlet weak var pageSwitcher: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    
    let loginViewController = LoginViewController()
    let registerViewController = RegistrationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        loginViewController.userSigningDelegate = self
        registerViewController.userSigningDelegate = self
    }
    
    func setupContentView() {
        if pageSwitcher.selectedSegmentIndex == 0 {
            contentView.addSubview(registerViewController.view)
            addChild(registerViewController)
            addSubViewConstraints(registerViewController.view)
        } else {
            contentView.addSubview(loginViewController.view)
            addChild(loginViewController)
            addSubViewConstraints(loginViewController.view)
        }
    }
    
    func addSubViewConstraints(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }

    @IBAction func pageSwitcherTriggered(_ sender: UISegmentedControl) {
        setupContentView()
    }
}

extension UserAccountViewController: UserSigningDelegate {
    
    func userLoggedIn(_ email: String, _ password: String) {
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)

        navigationController.navigationBar.isOpaque = true
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.backgroundColor = .white
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }
    
    func userRegistered(_ username: String, _ email: String) {
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)

        navigationController.navigationBar.isOpaque = true
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.backgroundColor = .white
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }
}
