//
//  ChatVC.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var collectionView: ChatCollectionView!
    @IBOutlet weak var footerCameraIcon: UIImageView!
    @IBOutlet weak var footerLabel: UILabel!
    
    let viewModel: ChatViewModel = ChatViewModel()
    var refreshControl: UIRefreshControl!
    
    var userData: [UserDataTemp] = [] {
        didSet {
            collectionView.userData = userData
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        footerCameraIcon.image = UIImage(named: "camera-7")
        refreshPage()
        collectionView.cellTappedListener = self
        collectionView.toggleSettingsDelegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupRefreshControl() {
        self.refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshPage), for: .valueChanged)
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        } else {
            collectionView.addSubview(refreshControl)
        }
    }
    
    @objc private func refreshPage() {
        refreshControl.beginRefreshing()
        self.viewModel.getUserMessageDictionary(didFinishWithSuccess: { (userDataValues) in
            self.userData = userDataValues
            self.refreshControl.endRefreshing()
        }) { (errorCode, error) in
            print(errorCode, error)
            self.refreshControl.endRefreshing()
        }
    }
}

extension ChatVC: ToggleSettingsDelegate {
    func toggleSettings() {
        present(SettingsViewController(), animated: true, completion: nil)
    }
}

extension ChatVC: CellTappedListener {
    func cellTapped(_ indexPath: IndexPath) {
        let chatLogViewController = ChatLogViewController()
        chatLogViewController.user = userData[indexPath.row].user
//        chatLogViewController.messages = userData[indexPath.row].messages
        self.navigationController?.pushViewController(chatLogViewController, animated: true)
    }
}
