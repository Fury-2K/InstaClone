//
//  ChatTableView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import Foundation
import UIKit

protocol CellTappedListener: class {
    func cellTapped(_ indexPath: IndexPath)
}

class ChatCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var userData: [UserDataTemp] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    var toggleSettingsDelegate: ToggleSettingsDelegate?
    var cellTappedListener: CellTappedListener?
    
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
        setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
        alwaysBounceVertical = true
        registerClasses()
    }
    
    func registerClasses() {
        register(UINib(nibName: "ChatViewCell", bundle: nil), forCellWithReuseIdentifier: "ChatViewCell")
        register(UINib(nibName: "ChatViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ChatViewHeader")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatViewCell", for: indexPath) as? ChatViewCell ?? ChatViewCell()
        let cellData = self.userData[indexPath.row]
        cell.setData(cellData)
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
        return CGSize(width: collectionView.frame.width, height: 71)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ChatViewHeader", for: indexPath) as? ChatViewHeader ?? ChatViewHeader()
            headerView.toggleSettingsDelegate = toggleSettingsDelegate
            return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 103)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellTappedListener?.cellTapped(indexPath)
    }

}
