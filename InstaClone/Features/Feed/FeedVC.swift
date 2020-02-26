//
//  HomePageVC.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit
import MaterialComponents
import MaterialComponents.MaterialBottomSheet_ShapeThemer

class FeedVC: UIViewController {
    
    @IBOutlet weak var collectionView: FeedCollectionView!
    let viewModel: FeedViewModel = FeedViewModel()
    
    var bottomSheetController: MDCBottomSheetController = MDCBottomSheetController()
    var feedData: [FeedData] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        collectionView.onclickListener = self
        
        self.navigationController?.navigationBar.isHidden = true
        
        getPageData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
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
        
        let group = DispatchGroup()
        
        for _ in 0..<5 {
            group.enter()
            self.viewModel.getData(didFinishWithSuccess: { response in
                self.feedData.append(response)
                group.leave()
            }, didFinishWithError: { errorCode, error in
                print(error)
                group.leave()
            })
        }
        
        group.notify(queue: .main) {
            self.collectionView.data = self.feedData
            self.refreshControl.endRefreshing()
        }
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
        bottomSheetController = MDCBottomSheetController(contentViewController: ChatVC())
        bottomSheetController.preferredContentSize = CGSize(width: self.preferredContentSize.width, height: 5 * 103 - 20)
        present(bottomSheetController, animated: true, completion: nil)
    }

    func saveBtnTapped(indexPath: IndexPath) {

    }

}
