//
//  FeedViewCell.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 24/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

protocol OnClickListener: class {
    func likesBtnTapped(indexPath: IndexPath)
    func commentBtnTapped(indexPath: IndexPath)
    func shareBtnTapped(indexPath: IndexPath)
    func saveBtnTapped(indexPath: IndexPath)
}

class FeedViewCell: UICollectionViewCell {
    
    var onClickListener: OnClickListener?
    var indexPath: IndexPath?
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var moreImageBtn: UIImageView!
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var likeImageBtn: UIImageView!
    @IBOutlet weak var commentImageBtn: UIImageView!
    @IBOutlet weak var shareImageBtn: UIImageView!
    @IBOutlet weak var saveImageBtn: UIImageView!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var currentUserImage: UIImageView!
    @IBOutlet weak var addCommentLabel: UILabel!
    @IBOutlet weak var postedTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        addTapGesture()
    }
    
    func setupCell() {
        self.moreImageBtn.image = UIImage(named: "dot-more-7")
        self.moreImageBtn.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
        self.likeImageBtn.image = UIImage(named: "heart-7")
        self.commentImageBtn.image = UIImage(named: "message-7")
        self.shareImageBtn.image = UIImage(named: "paper-plane-7")
        self.saveImageBtn.image = UIImage(named: "bookmark-7")
        self.commentsCountLabel.text = "View All 1284 Comments"
        self.addCommentLabel.text = "Add a comment..."
        self.postedTimeLabel.text = "13 hours ago"
        
        self.userProfileImage.layer.cornerRadius = self.userProfileImage.frame.height / 2
        self.currentUserImage.layer.cornerRadius = self.currentUserImage.frame.height / 2
    }
    
    func addTapGesture() {
        self.likeImageBtn.addTapGesture(#selector(likesBtnTapped), target: self)
        self.commentImageBtn.addTapGesture(#selector(commentBtnTapped), target: self)
        self.shareImageBtn.addTapGesture(#selector(shareBtnTapped), target: self)
        self.saveImageBtn.addTapGesture(#selector(saveBtnTapped), target: self)
    }
    
    func setData(_ cellData: FeedData) {
        self.userProfileImage.downloaded(from: cellData.feedPics[2])
        self.userNameLabel.text = String(cellData.firstName + " " + cellData.lastName)
        self.currentUserImage.downloaded(from: cellData.feedPics[2])
        self.postedImage.downloaded(from: cellData.feedPics[0])
        self.likesCountLabel.text = String(String(cellData.likes) + " likes")
    }
    
}

extension FeedViewCell {

    @objc func likesBtnTapped() {
        guard let indexPath = self.indexPath else { return }
        onClickListener?.likesBtnTapped(indexPath: indexPath)
    }

    @objc func commentBtnTapped() {
        guard let indexPath = self.indexPath else { return }
        onClickListener?.commentBtnTapped(indexPath: indexPath)
    }

    @objc func shareBtnTapped() {
        guard let indexPath = self.indexPath else { return }
        onClickListener?.shareBtnTapped(indexPath: indexPath)
    }

    @objc func saveBtnTapped() {
        guard let indexPath = self.indexPath else { return }
        onClickListener?.saveBtnTapped(indexPath: indexPath)
    }

}
