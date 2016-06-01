//
//  SettingsViewController.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/29/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var settingsTableView: UITableView!
    var rate:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Settings"
        
        self.settingsTableView.tableFooterView = UIView(frame: CGRectZero)
        
        rate = ""
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("pushNotificationCell", forIndexPath: indexPath)
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("soundCell", forIndexPath: indexPath)
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("vibrateCell", forIndexPath: indexPath)
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("contactUsCell", forIndexPath: indexPath)
            return cell
        }
        else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier("RateCell", forIndexPath: indexPath)
            return cell
        }
        else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCellWithIdentifier("shareCell", forIndexPath: indexPath)
            cell.separatorInset = UIEdgeInsetsMake(0.0, cell.bounds.size.width, 0.0, 0.0);
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("logoutCell", forIndexPath: indexPath)
            cell.separatorInset = UIEdgeInsetsMake(0.0, cell.bounds.size.width, 0.0, 0.0);
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == 3 {
            let dash:ContactUsViewController = storyBoard.instantiateViewControllerWithIdentifier("ContactUsViewController") as! ContactUsViewController
            self.navigationController?.pushViewController(dash, animated: true)
        }
        
        if indexPath.row == 4 {
            if( rate != nil) {
                UIApplication.sharedApplication().openURL(NSURL(string: "mailto://" + rate)!)
            }
            else {
                let alert = UIAlertView()
                alert.title = "Sorry!"
                alert.message = "Rate is not available for this business"
                alert.addButtonWithTitle("Ok")
                alert.show()
            }
        }
        
        if indexPath.row == 5 {
            let textToShare = "Reshotel is awesome!  Check out this website about it!"
            
            if let myWebsite = NSURL(string: "http://www.reshotel.in/")
            {
                let objectsToShare = [textToShare, myWebsite]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                self.presentViewController(activityVC, animated: true, completion: nil)
            }
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 6 {
            return 160.0
        }
        else {
            return 51.0
        }
    }
    
    @IBAction func logoutButtonAction(sender: AnyObject) {
        
    }

    @IBAction func pushNotificationSwitchAction(sender: AnyObject) {
    }
    
    @IBAction func soundSwitchAction(sender: AnyObject) {
    }
    
    @IBAction func vibrateSwitchAction(sender: AnyObject){
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
