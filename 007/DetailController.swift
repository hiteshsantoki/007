//
//  DetailController.swift
//  007
//
//  Created by Cronabit 1 on 10/11/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit
import Alamofire


class DetailController: UIViewController{
    
    @IBOutlet var found_name: UITextField!
    @IBOutlet var location_name: UITextField!
    @IBOutlet var date_text: UITextField!
    @IBOutlet var time_text: UITextField!
    @IBOutlet var quentity: UITextField!
    @IBOutlet var note_text: UITextField!
    @IBOutlet var handover: UITextField!

    var datadetail: String?
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
                        self.location_name.text = location
                        self.date_text.text = date
                        self.time_text.text = time
                        self.quentity.text = quenty
                        self.handover.text = hand_over
                        self.note_text.text = note
                        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       }
}
