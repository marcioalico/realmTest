//
//  Constants.swift
//  realmDemo1
//
//  Created by Applica on 18/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import Foundation
import RealmSwift

struct Constants {
    static let MY_INSTANCE_ADDRESS = "marcioalico.us1.cloud.realm.io"

    static let AUTH_URL  = URL(string: "https://\(MY_INSTANCE_ADDRESS)")!
    static let REALM_URL = URL(string: "realms://\(MY_INSTANCE_ADDRESS)/testRealm")!
}
    




