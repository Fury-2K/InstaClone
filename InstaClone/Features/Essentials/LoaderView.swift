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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // --------------------------
    // MARK:- Old implemenation (BlurEffectView)
    // --------------------------
     
     override init(frame: CGRect) {
     let blurEffect = UIBlurEffect(style: .dark)
     let blurEffectView = UIVisualEffectView(effect: blurEffect)
     blurEffectView.frame = frame
     blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     self.blurEffectView = blurEffectView
     super.init(frame: frame)
     self.tag = LoaderView.TAG
     addSubview(blurEffectView)
     addLoader()
     }
     
     private func addLoader() {
     let overlayView = UIView()
     overlayView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
     overlayView.backgroundColor = .white
     overlayView.layer.cornerRadius = 10
     
     guard let blurEffectView = blurEffectView else { return }
     let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
     activityIndicator.color = .gray
     activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
     overlayView.addSubview(activityIndicator)
     activityIndicator.center = overlayView.center
     activityIndicator.startAnimating()
     
     blurEffectView.contentView.addSubview(overlayView)
     overlayView.center = blurEffectView.contentView.center
     
     }
    
    // --------------------------
    // MARK: - UIAlertController
    // --------------------------
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
    }
    */
}
