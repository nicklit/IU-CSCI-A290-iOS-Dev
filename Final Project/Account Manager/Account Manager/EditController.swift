//
//  EditController.swift
//  Account Manager
//
//  Created by Luke Galle on 2/28/16.
//  Copyright © 2016 A290 Spring 2016 - Luke Galle. All rights reserved.
//

import UIKit


class EditController: UIViewController {
    
    @IBOutlet var accountLabel : UITextField!
    @IBOutlet var usernameLabel : UITextField!
    @IBOutlet var passwordLabel : UITextField!
    @IBOutlet var emailLabel : UITextField!
    
    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?
    // the reference to our data model:
    var model: AccountManagerModel?
    
    func showData(){
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        var accounts = model?.getAccounts()
        var usernames = model?.getUsernames()
        var passwords = model?.getPasswords()
        var emails = model?.getEmails()
        
        accountLabel.text = accounts![(model?.clicked)!]
        usernameLabel.text = usernames![(model?.clicked)!]
        passwordLabel.text = passwords![(model?.clicked)!]
        emailLabel.text = emails![(model?.clicked)!]
    }
    
    @IBAction func saveData(sender: AnyObject) {
    
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        model?.editAccount((model?.clicked)!, account: self.accountLabel.text!, username: self.usernameLabel.text!, password: self.passwordLabel.text!, email: self.emailLabel.text!)
        
        let alert = UIAlertController(title: "Account Manager", message: "Saved successfully", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: {action in self.goBack()}))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func goBack(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    override func viewDidLoad() {
        showData()
        
        self.title = "Edit"
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
