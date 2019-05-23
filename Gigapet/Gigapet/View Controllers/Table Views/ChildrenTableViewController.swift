//
//  ChildrenTableViewController.swift
//  Gigapet
//
//  Created by Alex on 5/22/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ChildrenTableViewController: UITableViewController {

    // MARK: - Constants
    
    var nc = MainPageViewController().nc
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddChild Segue" {
            guard let destinationVc = segue.destination as? AddChildViewController, let index = tableView.indexPathForSelectedRow else { return }
            let childToPass = nc.children[index.row]
            AppPresets.childId = childToPass.parentId //FIX - switch to childId
            destinationVc.child = childToPass
            destinationVc.nc = nc
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nc.children.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ChildTableViewCell
        
        cell.childNameLbl.text = "\(nc.children[indexPath.row].name)"
        
        return cell
    }
}
