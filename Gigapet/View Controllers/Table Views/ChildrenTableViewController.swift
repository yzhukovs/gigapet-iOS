//
//  ChildrenTableViewController.swift
//  Gigapet
//
//  Created by Alex on 5/22/19.
//  Copyright © 2019 Alex. All rights reserved.
//
import UIKit
import SwiftKeychainWrapper

class ChildrenTableViewController: UITableViewController {
    
    // MARK: - Constants
    
    var nc = MainPageViewController().nc {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear ran")
        nc.fetchChildren { (result) in
            print("Ran fetchChildren")
            if let children = try? result.get() {
                print(children, "HERE, child.")
                DispatchQueue.main.async {
                    self.nc.children = [children]
                    self.tableView.reloadData()
                }
            }
        }
        
//        //token
//        let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
//
//        if accessToken == nil {
//            //this means we have not signed in otherwise we would have our token
//            print("AccessToken nil.")
//        } else {
//            print("AccessToken not nil. ")
//            nc.fetchChildren { (result) in
//                print("Ran fetchChildren")
//                if let children = try? result.get() {
//                    DispatchQueue.main.async {
//                        self.nc.children = children
//                        self.tableView.reloadData()
//                    }
//                }
//            }
//        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddChild Segue" {
            guard let destinationVc = segue.destination as? AddChildViewController, let index = tableView.indexPathForSelectedRow else { return }
            let childToPass = nc.children[index.row]
            AppPresets.childId = childToPass.id //FIX - switch to childId
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
