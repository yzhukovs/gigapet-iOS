//
//  FoodDetailViewController.swift
//  Gigapet
//
//  Created by Alex on 5/20/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {

    // MARK: - Constants
    var childName: String?
    var foodName: String?
    var calorieCount: Int?
    var category: Category?
    
    
    // MARK: - Outlets
    
    @IBOutlet var childNameLbl: UILabel!
    @IBOutlet var foodNameLbl: UILabel!
    @IBOutlet var calorieLbl: UILabel!
    @IBOutlet var categoryLbl: UILabel!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
