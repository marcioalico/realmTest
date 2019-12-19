//
//  City.swift
//  realmDemo1
//
//  Created by Applica on 19/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import Foundation
import RealmSwift

class City: Object{
    @objc dynamic var cityName: String?
    @objc dynamic var cityId: String?
    
      override static func primaryKey() -> String? {
          return "cityId"
    }
}
