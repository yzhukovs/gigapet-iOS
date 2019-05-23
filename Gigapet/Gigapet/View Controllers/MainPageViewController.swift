//
//  MainPageViewController.swift
//  Gigapet
//
//  Created by Alex on 5/21/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    let nc = NetworkController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add Food Segue" {
            guard let destinationVC = segue.destination as? AddFoodViewController else { return }
            destinationVC.nc = nc
        }
        if segue.identifier == "Add Child Segue" {
            guard let destinationVC = segue.destination as? AddChildViewController else { return }
            destinationVC.nc = nc
        }
    }

}
