//
//  BoxViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 07/11/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class BoxViewController: UIViewController {

    
    @IBOutlet weak var topFlap: UIView!
    @IBOutlet weak var leftFlap: UIView!
    @IBOutlet weak var rightFlap: UIView!
    @IBOutlet weak var bottomFlap: UIView!
    @IBOutlet weak var animateBtn: UIButton!
        
    @IBOutlet weak var topFlapHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    var isOpen = true
    
    @IBAction func toggleAnimation(_ sender: UIButton) {

        let foldedTopFlapFrame = topFlap.frame.offsetBy(dx: 0, dy: 64)
        let foldedRightFlapFrame = rightFlap.frame.offsetBy(dx: -64, dy: 0)
        let foldedLeftFlapFrame = leftFlap.frame.offsetBy(dx: 64, dy: 0)
        let foldedBottomFlapFrame = bottomFlap.frame.offsetBy(dx: 0, dy: -64)
        
//        UIView.transition(with: topFlap, duration: 2.0, options: .transitionFlipFromBottom, animations: {
//            self.topFlap.frame = foldedTopFlapFrame
//            self.topFlap.backgroundColor = .black
//        }, completion: nil)
//
//        UIView.transition(with: rightFlap, duration: 2.0, options: .transitionFlipFromLeft, animations: {
//            self.rightFlap.frame = foldedRightFlapFrame
//            self.rightFlap.backgroundColor = .cyan
//        }, completion: nil)
//
//        UIView.transition(with: bottomFlap, duration: 2.0, options: .transitionFlipFromTop, animations: {
//            self.bottomFlap.frame = foldedBottomFlapFrame
//            self.bottomFlap.backgroundColor = .blue
//        }, completion: nil)
//
//        UIView.transition(with: leftFlap, duration: 2.0, options: .transitionFlipFromRight, animations: {
//            self.leftFlap.frame = foldedLeftFlapFrame
//            self.leftFlap.backgroundColor = .green
//        }, completion: nil)
        
        
//        if isOpen {
//            isOpen = false
//            leftFlap.backgroundColor = .black
//            UIView.transition(with: leftFlap, duration: 1.0, options: .transitionFlipFromRight, animations: nil, completion: nil)
//        } else {
//            isOpen = true
//            leftFlap.backgroundColor = .cyan
//            UIView.transition(with: leftFlap, duration: 1.0, options: .transitionFlipFromRight, animations: nil, completion: nil)
//        }
    
//        UIView.transition(from: topFlap, to: bottomFlap, duration: 2.0, options: [.transitionCurlUp, .showHideTransitionViews, .repeat, .autoreverse], completion: nil)
        
        
        UIView.animate(withDuration: 2.0) {
            self.leftFlap.layer.transform = CATransform3DMakeRotation(.pi, 0.0, 1.0, 0.0)
        }
        
    }
    
    
}
