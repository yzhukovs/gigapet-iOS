//
//  LoginViewController.swift
//  Gigapet
//
//  Created by Alex on 5/20/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import SwiftyJWT

class LoginViewController: UIViewController {

    // MARK: - Constants
    
    let nc = NetworkController()

    // MARK: - Outlets

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Actions

    @IBAction func loginBtnPressed(_ sender: UIButton) {
        // Validate required fields are not empty
        if (usernameTextField.text?.isEmpty)! ||
            (passwordTextField.text?.isEmpty)! {
            // Display Alert message and return
            displayMessage(userMessage: "All fields are required to be filled in")
            return
        }
        
        // Not correct
        let user = User(name: usernameTextField.text!, password: passwordTextField.text!, email: "NA")
        
        nc.logIn(with: user) { (error) in
            if let error = error {
                print("HERE", error)
                return
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "Login Segue", sender: self)
            }
        }
    }
    
    // MARK: - VC Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Login Segue" {
            guard let destinationVC = segue.destination as? MainPageViewController else { return }
        }
    }

    // MARK: - Functions

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
