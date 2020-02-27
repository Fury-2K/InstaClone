//
//  MyAccountHostViewController.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 26/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


@available(iOS 13.0, *)
class MyAccountHostViewController: UIHostingController<AccountUIView> {
    
    init() {
        let contentView = AccountUIView()
        super.init(rootView: contentView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let currentUserUid = UserDefaults.standard.value(forKey: "currentUserUid")as? String,
            let currentUserData = UserData.getUser(with: currentUserUid) else { return }
        
        setupNavigationBar(currentUserData.username)
    }
    
    
}

