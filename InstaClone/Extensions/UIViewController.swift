//
//  UIViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 11/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import  UIKit

extension UIViewController {
    
    func showLoadingAnimation() {
        DispatchQueue.main.async {
            self.view.showLoadingAnimation()
        }
    }

    func hideLoadingAnimation() {
        DispatchQueue.main.async {
            self.view.hideLoadingAnimation()
        }
    }
    
}
