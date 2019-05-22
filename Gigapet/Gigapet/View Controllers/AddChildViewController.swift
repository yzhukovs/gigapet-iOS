//
//  AddChildViewController.swift
//  Gigapet
//
//  Created by Alex on 5/22/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class AddChildViewController: UIViewController {

    // MARK: - Constants
    
    var nc: NetworkController?{
        didSet{
            print("NC passed.")
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet var childNameTextField: UITextField!
    @IBOutlet var calorieGoalTextField: UITextField!

    // MARK: - Actions
    
    @IBAction func saveChildBtnPressed(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Functions
    
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
