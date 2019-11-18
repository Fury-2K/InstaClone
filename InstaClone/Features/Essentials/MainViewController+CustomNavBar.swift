//
//  MainViewController+CustomNavBar.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    func setupNavigationBar() {
        setupLeftNavBarItems()
        setupRightNavBarItems()
        setupRemainingnavBarItems()
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
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: cameraBtn), UIBarButtonItem(customView: titleLabel)]
    }
    
    private func setupRightNavBarItems() {
        let chatBtn = UIButton(type: .system)
        chatBtn.setImage(UIImage(named: "paper-plane-7"), for: .normal)
        let tvBtn = UIButton(type: .system)
        tvBtn.setImage(UIImage(named: "note-write-7"), for: .normal)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: chatBtn), UIBarButtonItem(customView: tvBtn)]
        
        chatBtn.addTarget(self, action: #selector(chatBtnTapped), for: .touchUpInside)
    }
    
    private func setupRemainingnavBarItems() {
        let titleImageView = UIImageView(image: UIImage(named: "animal-element-7"))
        navigationItem.titleView = titleImageView
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func chatBtnTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ChatVC(), animated: true)
    }
    
}
