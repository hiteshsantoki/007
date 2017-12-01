//
//  additemController.swift
//  007
//
//  Created by Cronabit 1 on 22/11/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit
import Alamofire

extension UITextField
{
    func applypadding()
    {
        let paddingView=UIView(frame: CGRect(x: 0, y: 0, width: 6, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextFieldViewMode.always
    }
}
class additemController: UIViewController, UITextFieldDelegate {
    
   
    @IBOutlet weak var add_userid: UITextField!
    @IBOutlet weak var Add_founditem: UITextField!
    @IBOutlet weak var add_location: UITextField!
    @IBOutlet weak var Add_date: UITextField!
    @IBOutlet weak var Add_time: UITextField!
    @IBOutlet weak var Add_qty: UITextField!
    @IBOutlet weak var Add_handovername: UITextField!
    @IBOutlet weak var Add_notes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.add_userid.applypadding()
        self.Add_founditem.applypadding()
        self.add_location.applypadding()
        self.Add_date.applypadding()
        self.Add_time.applypadding()
        self.Add_handovername.applypadding()
        self.Add_notes.applypadding()
        self.Add_qty.applypadding()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
        
}
    func tap(gesture: UITapGestureRecognizer) {
        Add_founditem.resignFirstResponder()
}
   
    @IBAction func save_additem(_ sender: Any)
    {
         let params = ["user_id":"1","found":"\(Add_founditem.text!)","location":"\(add_location.text!)","date":"\(Add_date.text!)","time":"\(Add_time.text!)","qty":"\(Add_qty.text!)","handed_over":"\(Add_handovername.text!)","notes":"\(Add_notes.text!)"]
        
       // print(params)
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
          ]
            Alamofire.request("http://192.168.0.105/007_api/api/addItem", method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
                
                print(response)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                storyboard.instantiateViewController(withIdentifier: "TableController")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableController") as! FoundController
                self.present(vc, animated: true, completion: nil)


            }
    }
           override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  }
