//
//  ChatVC.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    let viewModel: FeedViewModel = FeedViewModel()
    var refreshControl: UIRefreshControl!
    var feedData: [FeedData] = []
    
    @IBOutlet weak var collectionView: ChatCollectionView!
    @IBOutlet weak var footerCameraIcon: UIImageView!
    @IBOutlet weak var footerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        setupNavigationBar()
        footerCameraIcon.image = UIImage(named: "camera-7")
        setChatPage()
        
        collectionView.toggleSettingsDelegate = self
    }
    
    func setupRefreshControl() {
        self.refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshPage), for: .valueChanged)
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        } else {
            collectionView.addSubview(refreshControl)
        }
    }
    
    @objc func refreshPage() {
        setChatPage()
    }
    
    func setChatPage() {
        refreshControl.beginRefreshing()
        
        let group = DispatchGroup()
        
        for _ in 0..<5 {
            group.enter()
            self.viewModel.getData(didFinishWithSuccess: { response in
                self.feedData.append(response)
                group.leave()
            }, didFinishWithError: { errorCode, error in
                group.leave()
            })
        }
        
        group.notify(queue: .main) {
            self.collectionView.data = self.feedData
            self.refreshControl.endRefreshing()
        }
    }
    
}


extension ChatVC: UIGestureRecognizerDelegate {
    
    func setupNavigationBar() {
        setupLeftNavBarItems()
        setupRightNavBarItems()
    }
    
    private func setupLeftNavBarItems() {
        let leftBtn = UIButton(type: .system)
        leftBtn.setImage(UIImage(named: "connect-arrow-left-7"), for: .normal)
        let titleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 2
            label.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            label.textColor = .black
            label.setContentHuggingPriority(.required, for: .vertical)
            return label
        }()
        titleLabel.text = "Direct"
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: leftBtn), UIBarButtonItem(customView: titleLabel)]
        leftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
    }
    
    private func setupRightNavBarItems() {
        let chatBtn = UIButton(type: .system)
        chatBtn.setImage(UIImage(named: "write-simple-7"), for: .normal)
        let tvBtn = UIButton(type: .system)
        tvBtn.setImage(UIImage(named: "new-sign-badge-7"), for: .normal)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: chatBtn), UIBarButtonItem(customView: tvBtn)]
    }

    @objc func leftBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ChatVC: ToggleSettingsDelegate {
    func toggleSettings() {
        present(SettingsViewController(), animated: true, completion: nil)
    }
}
