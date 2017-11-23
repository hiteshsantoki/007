//
//  ViewController.swift
//  007
//
//  Created by Cronabit 1 on 09/11/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.username.applypadding()
        self.password.applypadding()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

