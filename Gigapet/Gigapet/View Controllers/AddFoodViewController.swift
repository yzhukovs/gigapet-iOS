//
//  AddFoodViewController.swift
//  Gigapet
//
//  Created by Alex on 5/22/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController {

    // MARK: - Constants
    
    var nc: NetworkController?{
        didSet{
            print("NC passed.")
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet var foodTextField: UITextField!
    @IBOutlet var caloriesTextField: UITextField!
    
    @IBOutlet var dairyBtn: UIButton!
    @IBOutlet var vegatablesBtn: UIButton!
    @IBOutlet var grainsBtn: UIButton!
    @IBOutlet var fruitsBtn: UIButton!
    @IBOutlet var proteinsBtn: UIButton!
    @IBOutlet var junkBtn: UIButton!
    
    // MARK: - Actions
    
    @IBAction func dairyBtnPressed(_ sender: UIButton) {
    }
    @IBAction func grainsBtnPressed(_ sender: UIButton) {
    }
    @IBAction func vegatablesBtnPressed(_ sender: UIButton) {
    }
    @IBAction func fruitsBtnPressed(_ sender: UIButton) {
    }
    @IBAction func proteinsBtnPressed(_ sender: UIButton) {
    }
    @IBAction func junkBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
    }
    
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
