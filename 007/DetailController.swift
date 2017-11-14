//
//  DetailController.swift
//  007
//
//  Created by Cronabit 1 on 10/11/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit


class DetailController: UIViewController{
    
    @IBOutlet var found_name: UITextField!
    @IBOutlet var location_name: UITextField!
    @IBOutlet var date_text: UITextField!
    @IBOutlet var time_text: UITextField!
    @IBOutlet var quentity: UITextField!
    @IBOutlet var note_text: UITextField!
    @IBOutlet var handover: UITextField!

    var datadetail: String?
    var dataarray: String?
    var TableData:Array< String > = Array < String >()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
              }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       }
}
