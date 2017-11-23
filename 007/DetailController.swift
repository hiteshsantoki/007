//
//  DetailController.swift
//  007
//
//  Created by Cronabit 1 on 10/11/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit
import Alamofire

class DetailController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var found_name: UITextField!
    @IBOutlet var location_name: UITextField!
    @IBOutlet var date_text: UITextField!
    @IBOutlet var time_text: UITextField!
    @IBOutlet var quentity: UITextField!
    @IBOutlet var note_text: UITextField!
    @IBOutlet var handover: UITextField!
    @IBOutlet weak var editlabel: UIBarButtonItem!
    @IBOutlet weak var datasave: UIButton!

    var id: String?
    var user_id : String?
    var found : String?
    var location : String?
    var date : String?
    var time : String?
    var quenty : String?
    var note : String?
    var hand_over : String?
    
  
    
   override func viewDidLoad() {
        super.viewDidLoad()
                        self.found_name.text = found
                        self.found_name.isEnabled = false
                        self.location_name.text = location
                        self.location_name.isEnabled = false
                        self.date_text.text = date
                        self.date_text.isEnabled = false
                        self.time_text.text = time
                        self.time_text.isEnabled = false
                        self.quentity.text = quenty
                        self.quentity.isEnabled = false
                        self.handover.text = hand_over
                        self.handover.isEnabled = false
                        self.note_text.text = note
                        self.note_text.isEnabled = false
    
                        self.found_name.applypadding()
                        self.location_name.applypadding()
                        self.date_text.applypadding()
                        self.time_text.applypadding()
                        self.quentity.applypadding()
                        self.note_text.applypadding()
                        self.handover.applypadding()
    datasave.isHidden = true
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(gesture:)))
    self.view.addGestureRecognizer(tapGesture)
    
    

    }
    func tap(gesture: UITapGestureRecognizer) {
        found_name.resignFirstResponder()
    }
    @IBAction func savedata(_ sender: Any) {
        let params = ["id":"\(id!)","user_id":"1","found":"\(found_name.text!)","location":"\(location_name.text!)","date":"\(date_text.text!)","time":"\(time_text.text!)","qty":"\(quentity.text!)","handed_over":"\(handover.text!)","notes":"\(note_text.text!)"]
        
        // print(params)
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        Alamofire.request("http://192.168.0.105/007_api/api/updateItem", method: .put, parameters: params, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
            
            print(response)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            storyboard.instantiateViewController(withIdentifier: "TableController")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableController") as! FoundController
            self.present(vc, animated: true, completion: nil)
            
        }

    }
    @IBAction func editData(_ sender: Any)
    {
        editlabel.title = ""
        datasave.isHidden = false
               self.found_name.isEnabled = true
       
        self.location_name.isEnabled = true
        
        self.date_text.isEnabled = true
       
        self.time_text.isEnabled = true
       
        self.quentity.isEnabled = true
        
        self.handover.isEnabled = true
        
        self.note_text.isEnabled = true

        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       }
}
