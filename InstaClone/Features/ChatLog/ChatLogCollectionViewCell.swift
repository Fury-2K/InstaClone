//
//  ChatLogCollectionViewCell.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 10/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

class ChatLogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var containerViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var timeStampLabelLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var timeStampLabelRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var timeStampHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addTapGesture(#selector(toggleTimeStampLabel), target: self)
    }

    func setupCell(_ cellData: Message, _ isBlue: Bool, _ cellWidth: CGFloat) {
        textLabel.text = cellData.text
        textLabel.textAlignment = isBlue ? .right : .left
        timeStampLabel.text = cellData.getFormattedTimeStamp()
        
        let maxAllowedBubbleWidth : CGFloat = cellWidth * 0.7
        let textHeight : CGFloat = cellData.text.height(withConstrainedWidth: maxAllowedBubbleWidth - 16, font: UIFont.systemFont(ofSize: 16))
        
        let calculatedBubbleWidth : CGFloat = cellData.text.width(withConstrainedHeight: textHeight, font: UIFont.systemFont(ofSize: 16))
        
        let calculatedContainerConstraint: CGFloat = cellWidth - calculatedBubbleWidth
        let maxContainerConstraint: CGFloat = cellWidth - maxAllowedBubbleWidth
        let containerConstriant: CGFloat = max(calculatedContainerConstraint, maxContainerConstraint)
        
        // UI-Adjustments
        containerView.backgroundColor = isBlue ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        containerViewLeftConstraint.constant = isBlue ? containerConstriant : 16
        containerViewRightConstraint.constant = isBlue ? 16 : containerConstriant
        timeStampLabel.textAlignment = isBlue ? .right : .left
        timeStampLabelLeftConstraint.constant = isBlue ? 0 : 16
        timeStampLabelRightConstraint.constant = isBlue ? 16 : 0
        containerView.layer.cornerRadius = 10
    }
    
    @objc func toggleTimeStampLabel() {
        UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseIn, animations: { [weak self] in
            self?.timeStampHeightConstraint.constant = 16
            self?.layoutIfNeeded()
        }) { (successfull) in
            if successfull {
                UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: { [weak self] in
                    self?.timeStampHeightConstraint.constant = 0
                    self?.layoutIfNeeded()
                })
            }
        }
    }
    
    static func sizeForItem(_ message: Message, width: CGFloat) -> CGSize {
        let height = message.text.height(withConstrainedWidth: width * 0.7, font: UIFont.systemFont(ofSize: 16)) + 32
        return CGSize(width: width, height: height)
    }
    
}
