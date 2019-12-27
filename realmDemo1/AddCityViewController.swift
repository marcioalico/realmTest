//
//  AddCityViewController.swift
//  realmDemo1
//
//  Created by Applica on 20/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import UIKit
import RealmSwift

class AddCityViewController: UIViewController {

    @IBOutlet var nameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardar(){
        let nameTxt = self.nameTxt.text!
        addCity(cityName: nameTxt, cityId: "")
        self.nameTxt.text! = ""
    }
    
    
    func addCity(cityName: String, cityId: String?){
        //realm = try! Realm()

        let city = City()
        city.cityName = cityName
        city.cityId = cityId

        try! Realm.instance.write {
            Realm.instance.add(city)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
