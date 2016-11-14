//
//  NewViewController.swift
//  Account Manager
//
//  Created by Luke Galle on 2/28/16.
//  Copyright © 2016 A290 Spring 2016 - Luke Galle. All rights reserved.
//

import UIKit


class NewViewController: UIViewController {
    
    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?
    // the reference to our data model:
    var model: AccountManagerModel?
    var viewcont: ViewController?
    
    @IBOutlet var accountField : UITextField!
    @IBOutlet var usernameField : UITextField!
    @IBOutlet var passwordField : UITextField!
    @IBOutlet var emailField : UITextField!
    
    @IBAction func saveData(sender: AnyObject) {
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        self.viewcont = self.appDelegate?.viewController
        
        model?.saveAccountNames(accountField.text!)
        model?.saveUsernames(usernameField.text!)
        model?.savePasswords(passwordField.text!)
        model?.saveEmails(emailField.text!)
                
        let alert = UIAlertController(title: "Account Manager", message: "Saved successfully", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: {action in self.goBack()}))
        self.presentViewController(alert, animated: true, completion: nil)

                
    }
    
    func goBack(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "New Account"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}