//
//  MainPageViewController.swift
//  Gigapet
//
//  Created by Alex on 5/21/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class MainPageViewController: UIViewController {

    let nc = NetworkController()
//    header: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWJqZWN0IjoxNCwiZW1haWwiOiJhYmNAZ21haWwuY29tIiwiaWF0IjoxNTU4NjM0MDUwLCJleHAiOjE1NTg3MDYwNTB9.59ZzkKslhP5zs68UDoAAY_MhM3njgneNrHCtgASxTMo

    


    @IBAction func logoutBtnPressed(_ sender: UIBarButtonItem) {
        KeychainWrapper.standard.removeObject(forKey: "accessToken")
        //        KeychainWrapper.standard.removeObject(forKey: "userId")
        
        let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = signInPage
    }
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
