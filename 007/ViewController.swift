//
//  ViewController.swift
//  007
//
//  Created by Cronabit 1 on 09/11/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Alamofire.request("http://192.168.0.105/007_api/api/items").responseJSON { response in
            if let json = response.result.value {
                if let jsonResult = json as? Array<Dictionary<String,String>> {
                    for item in jsonResult
                    {
                        let id = item["id"]!
                        print(id)
                    }
                }
            }
            
        }
}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

