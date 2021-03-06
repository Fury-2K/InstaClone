//
//  UserData+CoreDataClass.swift
//  InstaClone
//
//  Created by Manas Aggarwal on 13/02/20.
//  Copyright © 2020 Personal. All rights reserved.
//
//

import Foundation
import CoreData

public class UserData: NSManagedObject {

    static func saveUserData(username: String = "", email: String = "", profileImgUrl: String = "", uid: String = "", name: String = "") {
        
        // Check if data is present or not
        guard UserData.getUser(with: uid) == nil else { return }
        
        let userData = UserData(context: PersistenceService.context)
        userData.username = username
        userData.email = email
        userData.profileImgUrl = profileImgUrl
        userData.uid = uid
        userData.name = name
        PersistenceService.saveContext()
    }
    
    static func getUser(with uid: String) -> UserData? {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uid == %@", uid)
        fetchRequest.fetchLimit = 1
        
        do {
            let user = try PersistenceService.context.fetch(fetchRequest)
            return user.count == 0 ? nil : user[0]
        } catch { return nil }
    }
    
}
