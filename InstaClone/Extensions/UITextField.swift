//
//  UITextField.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 04/12/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    enum Alignment {
        case right
        case left
    }
    
    func setIcon( image: UIImage?, alignment: Alignment) {
        guard let image = image else { return }
        let iconView = UIImageView(frame: CGRect(x: 5, y: 5, width: 18, height: 18))
        iconView.image = image
        let iconContentView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContentView.addSubview(iconView)
        switch alignment {
        case .right:
            rightView = iconContentView
            rightViewMode = .always
        case .left:
            leftView = iconContentView
            leftViewMode = .always
        }
    }
}
