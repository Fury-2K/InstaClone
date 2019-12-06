//
//  ChatLogViewController+NavigationBar.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 03/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

extension ChatLogViewController: UIGestureRecognizerDelegate {
    
    func setupNavigationBar(_ username: String, _ name: String) {
        setupLeftNavBarItems(username, name)
        setupRightNavBarItems()
        setupRemainingnavBarItems()
    }
    
    private func setupLeftNavBarItems(_ username: String, _ name: String) {
        let leftBtn = UIButton(type: .system)
        leftBtn.setImage(UIImage(named: "connect-arrow-left-7"), for: .normal)
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            label.textColor = .black
            label.setContentHuggingPriority(.required, for: .vertical)
            return label
        }()
        titleLabel.text = username
        
        let subTitleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.font = UIFont.systemFont(ofSize: 10.0, weight: .regular)
            label.textColor = .gray
            label.setContentHuggingPriority(.required, for: .vertical)
            return label
        }()
        subTitleLabel.text = name
        
        let stackView = UIStackView.init(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 1
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "circle-user-7")
        imageView.layer.cornerRadius = imageView.frame.height / 2
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: leftBtn), UIBarButtonItem(customView: imageView), UIBarButtonItem(customView: stackView)]
        leftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
    }
    
    private func setupRightNavBarItems() {
        let infoBtn = UIButton(type: .system)
        infoBtn.setImage(UIImage(named: "animal-element-7"), for: .normal)
        let flagBtn = UIButton(type: .system)
        flagBtn.setImage(UIImage(named: "flag-7"), for: .normal)
        let videoBtn = UIButton(type: .system)
        videoBtn.setImage(UIImage(named: "video-camera-7"), for: .normal)
        
        let stackView = UIStackView.init(arrangedSubviews: [videoBtn, flagBtn, infoBtn])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
                
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stackView)
    }
    
    private func setupRemainingnavBarItems() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func leftBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}