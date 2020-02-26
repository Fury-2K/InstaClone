//
//  MyAccountHostViewController+CustomNavBar.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 26/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
extension MyAccountHostViewController {
    
    func setupNavigationBar(_ username: String?) {
        
        // TODO: Move this to BaseViewController
        clearNavBar()
        
        guard let username = username else { return }
        setupLeftNavBarItems(username)
        setupRightNavBarItems()
    }
    
    private func clearNavBar() {
        tabBarController?.navigationItem.leftBarButtonItems = nil
        tabBarController?.navigationItem.rightBarButtonItems = nil
        tabBarController?.navigationItem.titleView = nil
    }
    
    private func setupLeftNavBarItems(_ username: String) {
        let titleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            label.textColor = .black
            label.setContentHuggingPriority(.required, for: .vertical)
            return label
        }()
        titleLabel.text = username
        
        tabBarController?.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: titleLabel)]
    }
    
    private func setupRightNavBarItems() {
        let infoBtn = UIButton(type: .system)
        infoBtn.setImage(UIImage(named: "list-fat-7"), for: .normal)
        infoBtn.addTapGesture(#selector(menuBtnTapped), target: self)

        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoBtn)
    }
    
    @objc func menuBtnTapped(_ sender: UIButton) {
        print("Menu Btn Tapped")
    }
    
}
