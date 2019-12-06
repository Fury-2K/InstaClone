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
    let chatViewModel: ChatViewModel = ChatViewModel()
    var refreshControl: UIRefreshControl!
    var feedData: [FeedData] = []
    var userData: [User] = []
    
    @IBOutlet weak var collectionView: ChatCollectionView!
    @IBOutlet weak var footerCameraIcon: UIImageView!
    @IBOutlet weak var footerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        setupNavigationBar()
        footerCameraIcon.image = UIImage(named: "camera-7")
        //setChatPage()
        
        collectionView.cellTappedListener = self
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
        //setChatPage()
    }
    
    func setChatPage() {
        refreshControl.beginRefreshing()
        
        let group = DispatchGroup()
        
        
        group.enter()
        //            self.viewModel.getData(didFinishWithSuccess: { response in
        //                self.feedData.append(response)
        //                group.leave()
        //            }, didFinishWithError: { errorCode, error in
        //                group.leave()
        //            })
                    chatViewModel.getUsers(didFinishWithSuccess: { (response) in
                        self.userData.append(response)
                        group.leave()
                    }) { (errorCode, error) in
                        print(errorCode, error)
                        group.leave()
                    }
//        for _ in 0..<5 {
//
//        }
        
        group.notify(queue: .main) {
            self.collectionView.data = self.feedData
            self.refreshControl.endRefreshing()
        }
    }
    
}

extension ChatVC: ToggleSettingsDelegate {
    func toggleSettings() {
        chatViewModel.getUsers(didFinishWithSuccess: { (response) in
            print(response)
        }) { (errorCode, error) in
            print(error)
        }
        //present(SettingsViewController(), animated: true, completion: nil)
    }
}

extension ChatVC: CellTappedListener {
    func cellTapped(_ indexPath: IndexPath) {
        let chatLogViewController = ChatLogViewController()
        let name = feedData[indexPath.row].firstName + " " + feedData[indexPath.row].lastName
        let username = feedData[indexPath.row].username
        chatLogViewController.setupNavigationBar(username, name)
        self.navigationController?.pushViewController(chatLogViewController, animated: true)
    }
}
