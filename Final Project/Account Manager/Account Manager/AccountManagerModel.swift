//
//  AccountManagerModel.swift
//  Account Manager
//
//  Created by Luke Galle on 2/28/16.
//  Copyright © 2016 A290 Spring 2016 - Luke Galle. All rights reserved.
//

import Foundation

class AccountManagerModel {
    
    var clicked = 0
    let defaults = NSUserDefaults.standardUserDefaults()
    
    init(){
        if let a  = defaults.stringForKey("userremember"){}
        else{
            defaults.setValue(false, forKey: "userremember")
        }
        
        if let b  = defaults.stringForKey("passremember"){}
        else{
            defaults.setValue(false, forKey: "passremember")
        }
        
        if let c  = defaults.stringForKey("setfailures"){}
        else{
            defaults.setValue(100000, forKey: "setfailures")
        }
    }
    
    func setFailures(input: Int){
        defaults.setValue(input, forKey: "setfailures")
    }
    
    func getFailures() -> Int{
        return defaults.integerForKey("setfailures")
    }
    
    func setUserRemember(input:Bool){
        defaults.setValue(input, forKey: "userremember")
    }
    
    func isUserRemember() -> String{
        if let a  = defaults.stringForKey("userremember"){
            return defaults.stringForKey("userremember")!
        }
        else{
            return ""
        }
    }
    
    func setPassRemember(input:Bool){
        defaults.setValue(input, forKey: "passremember")
    }
    
    func isPassRemember() -> String{
        if let a  = defaults.stringForKey("passremember"){
            return defaults.stringForKey("passremember")!
        }
        else{
            return ""
        }
    }
    
    func deleteAccount(input:Int){
        
        var accounts = getAccounts()
        var usernames = getUsernames()
        var passwords = getPasswords()
        var emails = getEmails()
        
        accounts.removeAtIndex(input)
        usernames.removeAtIndex(input)
        passwords.removeAtIndex(input)
        emails.removeAtIndex(input)
        
        defaults.setObject(accounts, forKey: "accountsarray")
        defaults.setObject(usernames, forKey: "usernamesarray")
        defaults.setObject(passwords, forKey: "passwordsarray")
        defaults.setObject(emails, forKey: "emailsarray")
        
    }
    
    func editAccount(input:Int, account:String, username:String, password:String, email:String){
        
        var accounts = getAccounts()
        var usernames = getUsernames()
        var passwords = getPasswords()
        var emails = getEmails()
        
        accounts[input] = account
        usernames[input] = username
        passwords[input] = password
        emails[input] = email
        
        defaults.setObject(accounts, forKey: "accountsarray")
        defaults.setObject(usernames, forKey: "usernamesarray")
        defaults.setObject(passwords, forKey: "passwordsarray")
        defaults.setObject(emails, forKey: "emailsarray")
        
    }
    
    func saveAccountNames(input:String){
        if var name = defaults.stringArrayForKey("accountsarray"){
            name.append(input)
            defaults.setObject(name, forKey: "accountsarray")
        }
        else{
            let name = Array(arrayLiteral: input)
            defaults.setObject(name, forKey: "accountsarray")
        }
    }
    
    func saveUsernames(input:String){
        if var name = defaults.stringArrayForKey("usernamesarray"){
            name.append(input)
            defaults.setObject(name, forKey: "usernamesarray")
        }
        else{
            let name = Array(arrayLiteral: input)
            defaults.setObject(name, forKey: "usernamesarray")
        }
    }
    
    func savePasswords(input:String){
        if var name = defaults.stringArrayForKey("passwordsarray"){
            name.append(input)
            defaults.setObject(name, forKey: "passwordsarray")
        }
        else{
            let name = Array(arrayLiteral: input)
            defaults.setObject(name, forKey: "passwordsarray")
        }
    }
    
    func saveEmails(input:String){
        if var name = defaults.stringArrayForKey("emailsarray"){
            name.append(input)
            defaults.setObject(name, forKey: "emailsarray")
        }
        else{
            let name = Array(arrayLiteral: input)
            defaults.setObject(name, forKey: "emailsarray")
        }
    }
    
    func saveUser(input:String){
        defaults.setValue(input, forKey: "user")
    }
    
    func savePass(input:String){
        defaults.setValue(input, forKey: "pass")
    }
    
    func getAccounts() -> [String]{
        if let a  = defaults.stringArrayForKey("accountsarray"){
            return a
        }
        else{
            return []
        }
    }
    
    func getUsernames() -> [String]{
        if let a  = defaults.stringArrayForKey("usernamesarray"){
            return a
        }
        else{
            return []
        }
    }
    
    func getPasswords() -> [String]{
        if let a  = defaults.stringArrayForKey("passwordsarray"){
            return a
        }
        else{
            return []
        }    }
    
    func getEmails() -> [String]{
        if let a  = defaults.stringArrayForKey("emailsarray"){
            return a
        }
        else{
            return []
        }
    }
    
    func getUser() -> String{
        if let a  = defaults.stringForKey("user"){
            return a
        }
        else{
            return ""
        }
    }
    
    func getPass() -> String{
        if let a  = defaults.stringForKey("pass"){
            return a
        }
        else{
            return ""
        }
    }
    
    func clearNSUserDefaults(){
        for key in Array(defaults.dictionaryRepresentation().keys) {
            defaults.removeObjectForKey(key)
        }
    }
}