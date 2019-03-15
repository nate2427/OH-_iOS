//
//  SignUpViewController.swift
//  OH++
//
//  Created by Nate Baker on 3/14/19.
//  Copyright © 2019 Nate Baker. All rights reserved.
//

import UIKit
import FirebaseAuthUI

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirm_password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        // if the password does not match the confirmed password
        if password.text != confirm_password.text {
            // create an alert controller to display to the user who entered the incorrect password
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please Re-Enter Password", preferredStyle: .alert)
            // create an action
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // add the action to the alert controller
            alertController.addAction(defaultAction)
            // present the alert to the screen
            self.present(alertController, animated: true, completion: nil)
            
        }
        else {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                // if there is no error, then perform the segue to the profile page
                if error == nil {
                    self.performSegue(withIdentifier: "SignUpToProfileSegue", sender: self)
                }
                // there was an error
                else {
                    // create an alert controller
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    // create an action to add to the alert controller
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    // add the action to the alert controller
                    alertController.addAction(defaultAction)
                    // present the error
                    self.present(alertController, animated: true, completion: nil)
                }
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
