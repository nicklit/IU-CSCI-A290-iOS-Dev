//
//  ViewController.swift
//  Account Manager
//
//  Created by Luke Galle on 2/28/16.
//  Copyright © 2016 A290 Spring 2016 - Luke Galle. All rights reserved.
//

import UIKit

/* `UITableViewController` adopts the `UITableViewDataSource` protocol
customize by overriding inherited protocol implementations */
class ViewController: UITableViewController {
    
    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?
    // the reference to our data model:
    var model: AccountManagerModel?
    
    // the data to display
    var items = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel

        items = (model?.getAccounts())!
        
        self.tableView.backgroundColor = UIColor(red: 28.0/255.0, green: 158.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        self.title = "Accounts"
    }
    
    @IBAction func newAccount(sender: AnyObject) {
     
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NewViewController") as! NewViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }

    
    override func viewWillAppear(animated: Bool) {
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        items = (model?.getAccounts())!
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
    }
    
    /* `UITableView` consists of sections and rows
    default is a single section table, i.e., a plain list
    method returns the number of rows in this default section */
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int)
        -> Int {
            
            return self.items.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){

        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.model = self.appDelegate?.accountModel
        
        model?.clicked = indexPath.item
        
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("InformationViewController") as! InformationViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    /* `UITableViewCell` represent individual table cells
    table cells are reused
    a unique identifier is used to group reusable cells
    returns a cell for a given section and row */
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            
            let item = self.items[indexPath.row]
            
            let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
            cell.textLabel!.text = item as! String
            cell.layer.borderColor = UIColor.blackColor().CGColor
            cell.layer.borderWidth = 1.0
            cell.layer.masksToBounds = true
            return cell
    }
}
