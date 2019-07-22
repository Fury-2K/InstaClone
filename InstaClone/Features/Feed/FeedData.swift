//
//  FeedData.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 22/07/19.
//  Copyright © 2019 zopsmart. All rights reserved.
//

import Foundation
import UIKit

class FeedData {
    let gender: String
    let firstName: String
    let lastName: String
    let email: String
    let dp: [String]
    
    init(_ gender: String, _ firstName: String, _ lastName: String, _ email: String, _ dp: [String]) {
        self.gender = gender
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dp = dp
    }
}
