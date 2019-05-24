//
//  FoodTableViewController.swift
//  Gigapet
//
//  Created by Alex on 5/20/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear ran in Food Table View.")

        if let childId = AppPresets.childId {
            print("HERE", childId)
            nc.fetchFoods(childId: childId) { (result) in
                print("Inside fetch foods", childId, result)
                if let foods = try? result.get() {
                    print("Foods HERE:", foods)
                    DispatchQueue.main.async {
                        self.nc.foods = foods
                        self.tableView.reloadData()
                    }
                } else {
                    self.displayMessage(userMessage: "Please select your child from the child view first.")
                }
        }}
        
        
//        //token
//        let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
//
//        if accessToken == nil {
//            //this means we have not signed in otherwise we would have our token
//            performSegue(withIdentifier: "Login Segue", sender: self)
//        } else {
//            nc.fetchFoods { (result) in
//                if let foods = try? result.get() {
//                    DispatchQueue.main.async {
//                        self.nc.foods = foods
//                        self.tableView.reloadData()
//                    }
//                }
//            }
//        }
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                // Code in this block will trigger when OK button tapped.
                print("Ok button tapped")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
        }
    }
    
}
