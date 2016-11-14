//
//  InformationViewController.swift
//  Account Manager
//
//  Created by Luke Galle on 2/28/16.
//  Copyright © 2016 A290 Spring 2016 - Luke Galle. All rights reserved.
//


import UIKit


class InformationViewController: UIViewController {
    
    @IBOutlet var accountLabel : UILabel!
    @IBOutlet var usernameLabel : UILabel!
    @IBOutlet var passwordLabel : UILabel!
    @IBOutlet var emailLabel : UILabel!
    
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
        
        accountLabel.text = "Account Name: " + accounts![(model?.clicked)!]
        usernameLabel.text = "Username: " + usernames![(model?.clicked)!]
        passwordLabel.text = "Password: " + passwords![(model?.clicked)!]
        emailLabel.text = "Email: " + emails![(model?.clicked)!]
        
    }
    
    @IBAction func deleteData(sender: AnyObject) {
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        model?.deleteAccount((model?.clicked)!)
        
        accountLabel.text = ""
        usernameLabel.text = ""
        passwordLabel.text = ""
        emailLabel.text = ""
        
        let alert = UIAlertController(title: "Account Manager", message: "Deletion successful.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: {action in self.goBack()}))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func goBack(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func editData(sender: AnyObject) {
        
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("EditController") as! EditController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        showData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Information"
        
        showData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

