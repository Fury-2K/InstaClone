//
//  LoaderView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 11/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import UIKit

class LoaderView: UIView {

    static let TAG: Int = 989
    
    var blurEffectView: UIVisualEffectView?

    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView = blurEffectView
        super.init(frame: frame)
        addSubview(blurEffectView)
        addLoader()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addLoader() {
        guard let blurEffectView = blurEffectView else { return }
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        blurEffectView.contentView.addSubview(activityIndicator)
        activityIndicator.center = blurEffectView.contentView.center
        activityIndicator.startAnimating()
    }
    
//    convenience init(_ side: CGFloat = 120) {
//        self.init(frame: CGRect(x: 0, y: 0, width: side, height: side))
//
//        let overlayView : UIView!
//        let activityIndicator : UIActivityIndicatorView!
//
//        overlayView = UIView()
//        activityIndicator = UIActivityIndicatorView()
//
//        overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
//        overlayView.backgroundColor = .black
//        overlayView.clipsToBounds = true
//        overlayView.layer.cornerRadius = 10
//        overlayView.layer.zPosition = 1
//
//        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
//        activityIndicator.style = .whiteLarge
//        activityIndicator.color = .gray
//        overlayView.addSubview(activityIndicator)
//    }
}
