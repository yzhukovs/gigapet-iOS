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
    
    var nc: NetworkController? {
        didSet{
            print("NC passed.")
        }
    }
    var child: Child? {
        didSet {
            print("Child passed.")
            updateViews()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet var childNameTextField: UITextField!
    @IBOutlet var calorieGoalTextField: UITextField!

    // MARK: - Actions
    
    @IBAction func saveChildBtnPressed(_ sender: UIBarButtonItem) {
        print("Clicked save child.")
        // Validate required fields are not empty
        if (childNameTextField.text?.isEmpty)! ||
            (calorieGoalTextField.text?.isEmpty)! {
            // Display Alert message and return
            displayMessage(userMessage: "All fields are required to be filled in")
            return
        }
        
        nc?.addChild(name: childNameTextField.text!, calorieGoal: Int(calorieGoalTextField.text!)!, completion: { (error) in
            if let error = error {
                print(error)
                return
            }
            print("Added Child, headed to previous VC now.")
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    

    private func updateViews(){
        guard let passedChild = child, isViewLoaded else {
            title = "Add Child"
            return}
        title = passedChild.name
        childNameTextField.text = passedChild.name
        calorieGoalTextField.text = String(passedChild.calorieGoal)
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
