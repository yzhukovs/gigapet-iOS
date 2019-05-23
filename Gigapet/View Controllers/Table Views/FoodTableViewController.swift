//
//  FoodTableViewController.swift
//  Gigapet
//
//  Created by Alex on 5/20/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {

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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Food Detail Segue" {
            guard let destinationVC = segue.destination as? FoodDetailViewController else { return }
//            destinationVC.calorieCount = 
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nc.foods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! FoodTableViewCell

        cell.foodNameLbl.text = "Food: \(nc.foods[indexPath.row].foodName)"
        cell.calorieLbl.text = "\(nc.foods[indexPath.row].calories)"

        return cell
    }

}
