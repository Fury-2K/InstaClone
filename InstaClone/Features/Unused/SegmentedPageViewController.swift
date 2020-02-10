//
//  SegmentedPageViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 05/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class SegmentedPageViewController: UIViewController {

    @IBOutlet var leftConstraint: NSLayoutConstraint!
    @IBOutlet var rightConstraint: NSLayoutConstraint!

    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var underlineView: UIView!
    
    public var selectedViewIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.addTapGesture(#selector(view1Tapped), target: self)
        view2.addTapGesture(#selector(view2Tapped), target: self)
    }

    @objc func view1Tapped() {
        if selectedViewIndex == 1 {
            switchView()
        }
    }
    
    @objc func view2Tapped() {
        if selectedViewIndex == 0 {
            switchView()
        }
    }
    
    private func switchView() {
        self.leftConstraint.constant = self.selectedViewIndex == 1 ? 0 : 207
        self.rightConstraint.constant = self.selectedViewIndex == 1 ? 207 : 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        selectedViewIndex = selectedViewIndex == 0 ? 1 : 0
    }
}
