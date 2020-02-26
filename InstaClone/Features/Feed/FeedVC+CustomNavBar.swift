//
//  FeedVC+CustomNavBar.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 26/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import UIKit

extension FeedVC {
    
    func setupNavigationBar() {
        setupLeftNavBarItems()
        setupRightNavBarItems()
        setupCenterNavBarItem()
    }
    
    private func setupLeftNavBarItems() {
        let cameraBtn = UIButton(type: .system)
        cameraBtn.setImage(UIImage(named: "camera-7"), for: .normal)
        let titleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 2
            label.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            label.textColor = .black
            label.setContentHuggingPriority(.required, for: .vertical)
            return label
        }()
        titleLabel.text = "InstaClone"
        tabBarController?.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: cameraBtn), UIBarButtonItem(customView: titleLabel)]
    }
    
    private func setupRightNavBarItems() {
        let chatBtn = UIButton(type: .system)
        chatBtn.setImage(UIImage(named: "paper-plane-7"), for: .normal)
        let tvBtn = UIButton(type: .system)
        tvBtn.setImage(UIImage(named: "note-write-7"), for: .normal)
        tabBarController?.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: chatBtn), UIBarButtonItem(customView: tvBtn)]
        
        chatBtn.addTarget(self, action: #selector(chatBtnTapped), for: .touchUpInside)
    }
    
    private func setupCenterNavBarItem() {
        let titleImageView = UIImageView(image: UIImage(named: "animal-element-7"))
        titleImageView.addTapGesture(#selector(logoutUser), target: self)
        tabBarController?.navigationItem.titleView = titleImageView
    }
    
    @objc func chatBtnTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ChatVC(), animated: true)
    }
    
    @objc func logoutUser() {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.removeObject(forKey: "currentUserUid")
        let userAccountViewController = UserAccountViewController()
        userAccountViewController.modalPresentationStyle = .fullScreen
        present(userAccountViewController, animated: true) {
            UIApplication.shared.keyWindow?.rootViewController = UserAccountViewController()
        }
    }
}
