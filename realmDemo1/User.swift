//
//  User.swift
//  realmDemo1
//
//  Created by Applica on 17/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name: String?
    @objc dynamic var lastName: String?
    @objc dynamic var userId: String?
    @objc dynamic var city: City?
      
      
      override static func primaryKey() -> String? {
          return "userId"
    }
    
    
//    func IncrementID() -> Int{
//        let realm = Realm.instance
//
//        let ultId = realm.objects(User.self).sorted(byKeyPath: "id").first?.userId
//
//        let idToInt = (ultId as! NSString).integerValue
//
//        if let retNext = ultId {
//            return idToInt + 1
//        }else{
//            return 1
//        }
//    }
    
}
