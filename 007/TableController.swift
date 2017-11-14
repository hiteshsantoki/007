//
//  TableController.swift
//  007
//
//  Created by Cronabit 1 on 14/11/17.
//  Copyright © 2017 Cronabit 1. All rights reserved.
//

import UIKit
import Alamofire

class TableController: UITableViewController {

    var TableData:Array< String > = Array < String >()
    var TableId:Array< String > = Array < String >()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("http://192.168.0.105/007_api/api/items").responseJSON { response in
            if let json = response.result.value {
                if let jsonResult = json as? Array<Dictionary<String,String>> {
                    for item in jsonResult
                    {
                        let found = item["found"]!
                        let id = item["id"]!
                        print(found)
                        
                        self.TableData.append(found)
                        self.TableId.append(id)
                        
                        
                    }
                     DispatchQueue.main.async(execute: {self.do_table_refresh()})
                }
            }
            
        }
        
    }
    func do_table_refresh()
    {
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = TableData[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "passdetails"{
            let TC2 = segue.destination as? DetailController
            let blogIndex = tableView.indexPathForSelectedRow?.row
             do {
                TC2?.datadetail = TableId[blogIndex!]
           }
        }
    }

}
