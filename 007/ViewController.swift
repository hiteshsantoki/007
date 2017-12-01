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
    
    @IBAction func login(_ sender: Any)
    {
        
        if(username.text != "" && password.text != "")
        {
            
            let params = ["username":"\(username.text!)","password":"\(password.text!)"]
            let headers = [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
            Alamofire.request("http://192.168.0.105/007_api/api/login", method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
                if let json = response.result.value {
                    if let jsonResult = json as? Array<Dictionary<String,String>> {
                       for item in jsonResult
                        {
                            let id = item["id"]!
                           if (id != "")
                           {
                                print("asdfasdfa")
                                self.performSegue(withIdentifier: "signin", sender: sender)
                            }
                        }
                    }
                    else
                    {
                        self.alert()
                    }
                }
            }
        }
        else
        {
            self.alert()
        }
    }
    public func alert()
    {
        let alertView = UIAlertController(title: "Login", message: "plz enter uname and password", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertView, animated: true, completion: nil)
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

