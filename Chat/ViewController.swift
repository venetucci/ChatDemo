//
//  ViewController.swift
//  Chat
//
//  Created by Michelle Venetucci Harvey on 3/16/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressLoginButton(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameTextField.text, password: passwordTextField.text) { (user: PFUser!, error: NSError!) -> Void in
            
            if user != nil {
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else {
                println(error.description)
            }
        }
    }

    @IBAction func didPressSignupButton(sender: AnyObject) {
        var user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            //
            if success {
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else {
                var alertView = UIAlertView(title: "Oops", message: error.description, delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
            }
            println("User created")
        }
    }
    
    
    
    
    
    
}