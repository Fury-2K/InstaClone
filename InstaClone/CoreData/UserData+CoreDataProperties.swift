//
//  UserData+CoreDataProperties.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 13/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//
//

import Foundation
import CoreData

extension UserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserData> {
        return NSFetchRequest<UserData>(entityName: "UserData")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var profileImgUrl: String?
    @NSManaged public var uid: String?

}
