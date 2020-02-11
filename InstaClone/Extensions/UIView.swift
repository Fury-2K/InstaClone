//
//  UIView.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 04/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    @discardableResult func addTapGesture(_ selector: Selector, target: AnyObject?, numberOfTapsRequired: Int = 1) -> UITapGestureRecognizer {
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        tapGesture.numberOfTapsRequired = numberOfTapsRequired
        addGestureRecognizer(tapGesture)
        return tapGesture
    }

    func showLoadingAnimation() {
        let loader = LoaderView(frame: frame)
        self.addSubview(loader)
        isUserInteractionEnabled = false
    }

    func hideLoadingAnimation() {
        viewWithTag(LoaderView.TAG)?.removeFromSuperview()
        isUserInteractionEnabled = true
    }

}

