//
//  ViewController.swift
//  realmDemo1
//
//  Created by Applica on 17/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    //var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addUser(name: "nombre0", lastName: "apllido0", userId: "0")
        addCity(cityName: "Santa Fe", cityId: "0")
        //realm = try! Realm()
    }

    
    func addUser(name: String, lastName: String, userId: String){
        //realm = try! Realm()
 
        let user = User()
        user.name = name
        user.lastName = lastName
        user.userId = userId
        
        try! Realm.instance.write {
            Realm.instance.add(user)
        }
    }
    
    
    func addCity(cityName: String, cityId: String){
        //realm = try! Realm()

        let city = City()
        city.cityName = cityName
        city.cityId = cityId

        try! Realm.instance.write {
            Realm.instance.add(city)
        }
    }
        
}
        
//        DispatchQueue(label: "background").async {
//            autoreleasepool {
//                let realm = try! Realm()
//                let city = realm.objects(City.self).first
//                try! realm.write {
//                    city!.cityName = cityName
//                    city!.cityId = cityId
//                }
//            }
//        }
    
    
//}

extension Realm {
//    ! Realm instance
    static var instance:Realm {
        get {
            let realm: Realm
            do {
                let config = SyncUser.current?.configuration(realmURL: Constants.REALM_URL)
                realm = try! Realm()
                //realm = try! Realm(configuration: config!)
                return realm
            }
            catch let e {
                print(e)
                fatalError()
            }
        }
    }
}

