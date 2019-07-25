//
//  HomePageVC.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    @IBOutlet weak var collectionView: FeedCollectionView!
    let viewModel: FeedViewModel = FeedViewModel()
    
    var feedData: [FeedData] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        self.collectionView.contentInset = UIEdgeInsets(top: -45, left: 0, bottom: 0, right: 0)
        collectionView.onclickListener = self
        getPageData()
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
        getPageData()
    }
    
    func getPageData() {
        refreshControl.beginRefreshing()
        self.viewModel.getData(didFinishWithSuccess: { data in
            self.feedData.append(data)
            self.viewModel.getData(didFinishWithSuccess: { data in
                self.feedData.append(data)
                self.viewModel.getData(didFinishWithSuccess: { data in
                    self.feedData.append(data)
                    self.viewModel.getData(didFinishWithSuccess: { data in
                        self.feedData.append(data)
                        self.viewModel.getData(didFinishWithSuccess: { data in
                            self.feedData.append(data)
                            self.collectionView.data = self.feedData
                            self.collectionView.reloadData()
                            self.refreshControl.endRefreshing()
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

extension FeedVC: OnClickListener {

    func likesBtnTapped(indexPath: IndexPath) {
        self.feedData[indexPath.row].likes += 1
        self.collectionView.reloadData()
    }

    func commentBtnTapped(indexPath: IndexPath) {

    }

    func shareBtnTapped(indexPath: IndexPath) {
        self.navigationController?.pushViewController(ChatVC(), animated: true)
    }

    func saveBtnTapped(indexPath: IndexPath) {

    }

}
