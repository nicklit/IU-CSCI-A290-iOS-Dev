//
//  Settings.swift
//  Account Manager
//
//  Created by Luke Galle on 2/29/16.
//  Copyright © 2016 A290 Spring 2016 - Luke Galle. All rights reserved.
//

import UIKit


class Settings: UIViewController {
    
    @IBOutlet var rPass : UISwitch?
    @IBOutlet var rUser : UISwitch?
    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?
    // the reference to our data model:
    var model: AccountManagerModel?
    

    override func viewDidLoad() {
        self.title = "Settings"
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        if((model?.isUserRemember())!) == "1"{
            rUser?.setOn(true, animated: true)
        }
        else{
            rUser?.setOn(false, animated: false)
        }
        
        if((model?.isPassRemember())!) == "1"{
            rPass?.setOn(true, animated: true)
        }
        else{
            rPass?.setOn(false, animated: false)
        }
        
    }
    
    @IBAction func eraseAll(sender: AnyObject) {
        
        print("Called")
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel

        
        let passwordPrompt = UIAlertController(title: "Account Manager", message: "Are you sure you want to reset the application?  All data will be lost", preferredStyle: UIAlertControllerStyle.Alert)
        passwordPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        passwordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            self.model?.clearNSUserDefaults()
            exit(0)
            
        }))
        
        presentViewController(passwordPrompt, animated: true, completion: nil)

        
    }
    
    @IBAction func rememberUsername(sender: AnyObject) {
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
     
        model?.setUserRemember((rUser?.on)!)
        
    }
    
    
    @IBAction func rememberPass(sender: AnyObject) {
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        model?.setPassRemember((rPass?.on)!)
        
    }
    
    @IBAction func changePass(sender: AnyObject){
    
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        var oldpasswordField: UITextField?
        var newpassword: UITextField?
        var reenter: UITextField?
        let passwordPrompt = UIAlertController(title: "Enter Password", message: "You have selected to change your passwod.", preferredStyle: UIAlertControllerStyle.Alert)
        passwordPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        passwordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            if(self.model?.getPass() == oldpasswordField?.text! && newpassword?.text! == reenter?.text!){
                print("in")
                self.model?.savePass((newpassword?.text)!)
            }
            
        }))
        passwordPrompt.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Old Password"
            textField.secureTextEntry = true
            oldpasswordField = textField
        })
        passwordPrompt.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "New Password"
            textField.secureTextEntry = true
            newpassword = textField
        })
        passwordPrompt.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Reenter New Password"
            textField.secureTextEntry = true
            reenter = textField
        })
        
        presentViewController(passwordPrompt, animated: true, completion: nil)
    
    }
    
    @IBAction func changeUser(sender: AnyObject){
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        var olduserField: UITextField?
        var newuser: UITextField?
        var reenter: UITextField?
        let passwordPrompt = UIAlertController(title: "Enter Username", message: "You have selected to change your username.", preferredStyle: UIAlertControllerStyle.Alert)
        passwordPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        passwordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            if(self.model?.getUser() == olduserField?.text! && newuser?.text! == reenter?.text!){
                self.model?.saveUser((newuser?.text)!)
            }
            
        }))
        passwordPrompt.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Old Username"
            olduserField = textField
        })
        passwordPrompt.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "New Username"
            newuser = textField
        })
        passwordPrompt.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Reenter New Username"
            reenter = textField
        })
        
        presentViewController(passwordPrompt, animated: true, completion: nil)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutAndExit(sender: AnyObject){
        exit(0)
    }

    
}
