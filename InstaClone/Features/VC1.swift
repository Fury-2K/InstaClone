//
//  VC1.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class VC1: UIViewController {

    @IBOutlet weak var headerView1: UIView!
    @IBOutlet weak var headerView2: UIView!
    @IBOutlet weak var collectionView: VC1CollectionView!
    
    @IBOutlet weak var headerView1Height: NSLayoutConstraint!
    @IBOutlet weak var headerView2Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        collectionView.scrollDelegate = self
    }
}

extension VC1: ScrollDelegate {
    
    func handleScrolling(_ scrollView: UIScrollView) {
        headerView1Height.constant = 50 - scrollView.contentOffset.y
        
        //        headerView2Height.constant = 50 + ((scrollView.contentOffset.y) <= 50 ? scrollView.contentOffset.y : 0)
        
//        if (scrollView.contentOffset.y) <= 50 {
//            headerView2Height.constant = 50 + scrollView.contentOffset.y
//        } else if (scrollView.contentOffset.y) > 50 {
//            UIView.animate(withDuration: 5, animations: {
//                self.headerView2Height.constant = 50
//            })
//        }

        
    }
    
    func scrolled(_ scrollView: UIScrollView) {
        handleScrolling(scrollView)
    }
    
}
