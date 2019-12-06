//
//  VC1CollectionView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 30/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import UIKit

protocol ScrollDelegate: class {
    func scrolled(_ scrollView: UIScrollView)
}

class VC1CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var scrollDelegate: ScrollDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    func sharedInit() {
        dataSource = self
        isScrollEnabled = true
        delegate = self
        alwaysBounceVertical = true
        setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
        registerClasses()
    }
    
    func registerClasses() {
        register(UINib(nibName: "VC1ScrollCell", bundle: nil), forCellWithReuseIdentifier: "VC1ScrollCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VC1ScrollCell", for: indexPath) as? VC1ScrollCell ?? VC1ScrollCell()
        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .lightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.scrolled(scrollView)
    }
    
}
