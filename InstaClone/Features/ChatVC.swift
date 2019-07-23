//
//  ChatVC.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    let viewModel: FeedViewModel = FeedViewModel()
    @IBOutlet weak var collectionView: ChatCollectionView!
    @IBOutlet weak var footerCameraIcon: UIImageView!
    @IBOutlet weak var footerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setChatPage()
    }
    
    func setChatPage() {
        self.footerCameraIcon.image = UIImage(named: "camera-7")
        self.footerLabel.text = "Camera"
        var feedData: [FeedData] = []
        self.viewModel.getData(didFinishWithSuccess: { data in
            feedData.append(data)
            self.viewModel.getData(didFinishWithSuccess: { data in
                feedData.append(data)
                self.viewModel.getData(didFinishWithSuccess: { data in
                    feedData.append(data)
                    self.viewModel.getData(didFinishWithSuccess: { data in
                        feedData.append(data)
                        self.viewModel.getData(didFinishWithSuccess: { data in
                            feedData.append(data)
                            self.collectionView.data = feedData
                        }, didFinishWithError: { errorCode, error in
                            print("\(errorCode) \(error)")
                        })
                    }, didFinishWithError: { errorCode, error in
                        print("\(errorCode) \(error)")
                    })
                }, didFinishWithError: { errorCode, error in
                    print("\(errorCode) \(error)")
                })
            }, didFinishWithError: { errorCode, error in
                print("\(errorCode) \(error)")
            })
        }, didFinishWithError: { errorCode, error in
            print("\(errorCode) \(error)")
        })
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
