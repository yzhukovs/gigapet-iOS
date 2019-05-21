//
//  SignupViewController.swift
//  Gigapet
//
//  Created by Alex on 5/20/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import SwiftyJWT

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class SignupViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBAction func signupPressed(_ sender: UIButton) {
        // Validate required fields are not empty
        if (usernameTextField.text?.isEmpty)! ||
            (passwordTextField.text?.isEmpty)! ||
            (emailTextField.text?.isEmpty)! {
            // Display Alert message and return
            displayMessage(userMessage: "All fields are required to be filled in")
            return
        }
        
        let user = User(name: usernameTextField.text!, password: passwordTextField.text!, email: emailTextField.text!)
        
        mySignUp(with: user) { (error) in
            if let error = error {
                print("HERE", error)
                return
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "Signup Segue", sender: self)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private let baseURL = URL(string: "https://giga-back-end.herokuapp.com/api")!
    
    func mySignUp(with user: User, completion: @escaping (Error?) -> Void){
        //get url in the doc/ its the endpoints
        let url = baseURL.appendingPathComponent("users/register")
        
        //now make the urlRequest remember to set the value of the content type. BUT HOW DO WE KNOW TO DO THIS?
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let je = JSONEncoder()
            request.httpBody =  try je.encode(user)
        } catch  {
            print("Error encoding the httpBody for the signup functon: \(error.localizedDescription)")
            completion(error)
            return
        }
        
        //now we can run the data task
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                //200 is a success
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            if let error = error {
                print("Error in the data task function of the signup functon: \(error.localizedDescription)")
                completion(error)
                return
            }
            completion(nil)
            }.resume()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Signup Segue" {
            guard let destinationVC = segue.destination as? MainPageViewController else { return }
        }
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
