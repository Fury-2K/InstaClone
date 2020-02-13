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
    
    /*
        Saving:-
        let person = Person(Context: PersistenceService.context)
        ...
        ...
        ...
        PersistenceService.saveContext()
     
        Fetching:-
        let fetchRequest = NSFetchRequest<Person> = Person.fetchRequest()
        do {
            let people = try PersistenceService.context.fetch(fetchRequest)
        } catch {}
     */
    
    /// Saves the data in the coreData model
    static func saveUserData(username: String = "", email: String = "", profileImgUrl: String = "", uid: String = "") {
        let userData = UserData(context: PersistenceService.context)
        userData.username = username
        userData.email = email
        userData.profileImgUrl = profileImgUrl
        userData.uid = uid
        PersistenceService.saveContext()
    }
    
    static func getUser(with uid: String) -> [UserData] {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uid == %a", uid)
        fetchRequest.fetchLimit = 1
        
        do {
            let user = try PersistenceService.context.fetch(fetchRequest)
            return user
        } catch { return [] }
    }
    
}
