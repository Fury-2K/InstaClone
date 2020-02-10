//
//  VC2.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 Fury2K. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        addViews()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // View property of the other VCs
    let homeWidgets = [
        ChatVC(),
        ChatVC(),
        ChatVC(),
        ChatVC()
    ]

    func setupScrollView() {
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addViews() {
        let widgetHeight: CGFloat = 200
        
        var upperView: UIView?
        let upperBottomConstraint: CGFloat = 16
        var totalHeight: CGFloat = 0
        
        scrollView.subviews.forEach({$0.removeFromSuperview()})
        
        for widget in homeWidgets {
            guard let widgetView = widget.view else {return}
            scrollView.addSubview(widgetView)
            widgetView.translatesAutoresizingMaskIntoConstraints = false
            if let upperView = upperView {
                widgetView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: upperBottomConstraint).isActive = true
            } else {
                widgetView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: upperBottomConstraint).isActive = true
            }
            upperView = widgetView
            widgetView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
            widgetView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
            widgetView.heightAnchor.constraint(equalToConstant: widgetHeight).isActive = true
            widgetView.clipsToBounds = true
            
            totalHeight += 16
            totalHeight += widgetHeight
        }
        self.view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: totalHeight)
    }
}
