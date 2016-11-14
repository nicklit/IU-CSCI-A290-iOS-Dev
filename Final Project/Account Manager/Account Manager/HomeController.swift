//
//  HomeController.swift
//  Account Manager
//
//  Created by Luke Galle on 2/29/16.
//  Copyright © 2016 A290 Spring 2016 - Luke Galle. All rights reserved.
//

import UIKit


class HomeController: UIViewController {
    
    @IBOutlet var user : UITextField!
    @IBOutlet var pass : UITextField!
    @IBOutlet var label : UILabel!
    
    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?
    // the reference to our data model:
    var model: AccountManagerModel?
    
    @IBAction func tryAccount(sender: AnyObject) {
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        if (model?.getPass())! == (self.pass.text)! && (model?.getUser())! == (self.user.text)!{
            performSegueWithIdentifier("mySeque", sender: self)
        }
        else{
            let alert = UIAlertController(title: "Incorrect Password", message: "Your username or password are incorrect.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func newAccount(sender: AnyObject) {
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        
        if (model?.getUser())! != ""{
        
            let passwordPrompt = UIAlertController(title: "Account Manager", message: "Are you sure you want to create a new account?  All data will be lost", preferredStyle: UIAlertControllerStyle.Alert)
            passwordPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
            passwordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
                self.model?.clearNSUserDefaults()
                self.performSegueWithIdentifier("newaccseque", sender: self)
                
            
            }))
            
            presentViewController(passwordPrompt, animated: true, completion: nil)

        }
        
        else{
            self.performSegueWithIdentifier("newaccseque", sender: self)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        print((model?.isUserRemember())!)
        print((model?.isPassRemember())!)
        
        if((model?.isUserRemember())!) == "1"{
            self.user.text = model?.getUser()
        }
        
        if((model?.isPassRemember())!) == "1"{
            self.pass.text = model?.getPass()
        }
        
        self.title = "Account Manager"
        label.backgroundColor = UIColor(red: 28.0/255.0, green: 158.0/255.0, blue: 201.0/255.0, alpha: 1.0)
    }

}
