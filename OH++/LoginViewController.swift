//
//  LoginViewController.swift
//  OH++
//
//  Created by Nate Baker on 3/4/19.
//  Copyright © 2019 Nate Baker. All rights reserved.
//

import UIKit
import FirebaseAuthUI

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        // attempt to login the user with the data entered
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { (user, error) in
            // if there was no error signing in, segue to the profile page
            if error == nil {
                print("successfully logged in")
                self.performSegue(withIdentifier: "LoginToProfileSegue", sender: self)
            }
            // else there was an error logging
            else {
                print("didnt log in successfully")
                // create an alert controller
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                // create an action to add to the alert controller
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                // add the action to the action controller
                alertController.addAction(defaultAction)
                // present the alert to the user
                self.present(alertController, animated: true, completion: nil)
                
            }
            
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
