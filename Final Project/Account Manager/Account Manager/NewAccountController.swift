
//
//  NewAccount.swift
//  Account Manager
//
//  Created by Luke Galle on 2/29/16.
//  Copyright © 2016 A290 Spring 2016 - Luke Galle. All rights reserved.
//


import UIKit


class NewAccount: UIViewController {
    
    @IBOutlet var user : UITextField!
    @IBOutlet var pass : UITextField!
    @IBOutlet var reenter : UITextField!
    @IBOutlet var label: UILabel!
    
    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?
    // the reference to our data model:
    var model: AccountManagerModel?
    
    
    @IBAction func saveAccount(sender: AnyObject) {
                
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        if(self.reenter.text != self.pass.text){
        let passwordPrompt = UIAlertController(title: "Account Manager", message: "Your passwords do not match", preferredStyle: UIAlertControllerStyle.Alert)

        passwordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
           
            
            
        }))
        
        presentViewController(passwordPrompt, animated: true, completion: nil)
        }
        
        else{
        
        model?.saveUser(self.user.text!)
        model?.savePass(self.pass.text!)
        
        let alert = UIAlertController(title: "Account Manager", message: "Account created successfully", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: {action in self.sendHandler()}))
        self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    func sendHandler(){
        performSegueWithIdentifier("newToHome", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.backgroundColor = UIColor(red: 28.0/255.0, green: 158.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        
        
    }
    
}
