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

    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    @IBOutlet var nameTxt: UITextField!
    @IBOutlet var lastNameTxt: UITextField!
    @IBOutlet var cityTxt: UITextField!
    @IBOutlet var vistaUsers: UIView!
    
    //var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //addUser(name: "nombre0", lastName: "apllido0", userId: "0")
        //addCity(cityName: "Santa Fe", cityId: "0")
        //realm = try! Realm()
        let creds    = SyncCredentials.usernamePassword(username: "marcio2", password: "marcio2", register: false)

            SyncUser.logIn(with: creds, server: Constants.AUTH_URL, onCompletion: { [weak self](user, err) in
            
            if let _ = user {
                // User is logged in
                print("LOGEAAADOO")
                print("LOGEAAADOO")
                print("LOGEAAADOO")
                print("LOGEAAADOO")
            } else if let error = err {
                fatalError(error.localizedDescription)
            }
        })
        
    }

    
   @IBAction func guardar(){
    
    let ultId = Realm.instance.objects(User.self).filter("userId = userId.@max")
    let ultimoId = ultId[0].userId
    let ultimoIdInt:Int? = Int(ultimoId!)
    let nuevoId = ultimoIdInt! + 1
    print(nuevoId)
    let nuevoIdString = String(nuevoId)
    
        let nameTxt = self.nameTxt.text!
        let lastNameTxt = self.lastNameTxt.text!
        
        self.nameTxt.text! = ""
        self.lastNameTxt.text! = ""
        self.cityTxt.text! = ""
        
        addUser(name: nameTxt, lastName: lastNameTxt, userId: nuevoIdString)
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
    
    class func getUsers() -> [User]? {
        let users = Realm.instance.objects(User.self).toArray(ofType: User.self) as [User]
        return users.count > 0 ? users : nil
    }
        
}


extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
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
                let config = Realm.Configuration(fileURL: Constants.REALM_URL)
                    //SyncUser.current?.configuration(realmURL: Constants.REALM_URL)
                realm = try! Realm(configuration: config)
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

