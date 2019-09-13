//
//  FeedHeaderView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 24/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
//

import UIKit

class FeedHeaderView: UICollectionReusableView {

    @IBOutlet weak var collectionView: FeedHeaderCollectionView!
    
    var data: [FeedData] = [] {
        didSet {
            self.collectionView.data = data
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.showsHorizontalScrollIndicator = false
//        self.collectionView.alwaysBounceHorizontal = false
        self.collectionView.bounces = false
    }
    
}
