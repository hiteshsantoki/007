//
//  FoundController.swift
//  007
//
//  Created by Cronabit 1 on 10/11/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit
import Alamofire

class FoundController: UIViewController , UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var tableview: UITableView!
    var TableData:Array< String > = Array < String >()
    var TableId:Array< String > = Array < String >()
    var itemdata : Array<Dictionary<String,String>> = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TableData.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
        
        cell.textLabel?.text = TableData[indexPath.row]
        
        return cell
     }
    public func numberOfSections(in tableView: UITableView) -> Int // Default is 1 if not implemented
    {
        return 1
    }
   public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if indexPath.row < TableData.count
        {
            TableData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
            
        }
    }
    override func viewDidLoad() {
    super.viewDidLoad()
        Alamofire.request("http://192.168.0.105/007_api/api/items").responseJSON { response in
            if let json = response.result.value {
                if let jsonResult = json as? Array<Dictionary<String,String>> {
                    self.itemdata = jsonResult
                    for item in jsonResult
                    {
                        let id = item["id"]!
                        let found = item["found"]!
                        self.TableData.append(found)
                        self.TableId.append(id)
                        self.tableview.reloadData()
                    }
                    
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "passdetails"{
            let TC2 = segue.destination as? DetailController
            let blogIndex = tableview.indexPathForSelectedRow?.row
            for item in self.itemdata
            {
                if (item["id"] == "\(TableId[blogIndex!])")
                {
                    TC2?.found = item["found"]!
                    TC2?.date = item["date"]!
                    TC2?.time = item["time"]!
                    TC2?.quenty = item["qty"]!
                    TC2?.hand_over = item["handed_over"]!
                    TC2?.note = item["notes"]!
                    TC2?.location = item["location"]!
                    
                }
            }
        }
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

 
}
