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
    dynamic var city: City?
      
      
      override static func primaryKey() -> String? {
          return "userId"
    }
    
}
