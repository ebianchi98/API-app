//
//  TableViewController.swift
//  bluescape
//
//  Created by Edoardo Bianchi on 6/28/17.
//  Copyright © 2017 ebianchi. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    
    var workspaces = [[String:Any]]()
    var userInfo = [[String:Any]]()
    
    public func loadWorkspaceData() {
        do {
                if let path = Bundle.main.url(forResource: "workspaces", withExtension: "json")
            {
                let jsonData = try Data(contentsOf: path)
                let json = try JSONSerialization.jsonObject(with: jsonData) as? [[String:Any]]
                for workspace in json! {
                    workspaces.append(workspace)
                }
            }
        }
        catch {
            print(error)
        }
    }

    func handleRefresh(refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        
        // Simply adding an object to the data source for this example
        
        
        
        self.tableView.reloadData()
        
        refreshControl.endRefreshing()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorkspaceData()
}
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workspaces.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell else {
            fatalError("The dequeued cell is not an instance of TableViewCell")
        }

        let workspace = workspaces[indexPath.row]
        
        cell.workspaceName?.text = workspace["name"] as? String
        
        let dateFormatter = DateFormatter()
        
        let timestamp = workspace["created_at"] as! String
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date = dateFormatter.date(from: timestamp)
        
        dateFormatter.dateFormat = "MM/dd/yy"
        let dateString = dateFormatter.string(from: date!)
        cell.workspaceTime.text = dateString
        
        // Configure the cell...
        
        return cell
}



    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
