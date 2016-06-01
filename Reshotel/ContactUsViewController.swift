//
//  ContactUsViewController.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/30/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "How We Can Help You?"
        self.message.text = "Message"
        self.message.textColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        self.message.delegate = self
        self.message.layer.borderColor = UIColor.grayColor().colorWithAlphaComponent(0.5).CGColor
        self.message.layer.borderWidth = 0.5
        self.message.layer.cornerRadius = 5
        self.message.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendAction(sender: AnyObject) {
        validate()
    }
    
    func validate() -> Bool {
        var flag:Bool = true
        let string:String = phoneNumber.text!
        let length = string.characters.count
        
        if (email.text!.isEmpty) {
            email.attributedPlaceholder = NSAttributedString(string:"Please enter email", attributes:[NSForegroundColorAttributeName: UIColor.redColor(),NSFontAttributeName :UIFont(name: "Arial", size: 14)!])
            flag = false
        }
        
        if (username.text!.isEmpty) {
            username.attributedPlaceholder = NSAttributedString(string:"Please enter username type", attributes:[NSForegroundColorAttributeName: UIColor.redColor(),NSFontAttributeName :UIFont(name: "Arial", size: 14)!])
            flag = false
        }
        
        if (phoneNumber.text!.isEmpty) {
            
            phoneNumber.attributedPlaceholder = NSAttributedString(string:"Please enter mobile no.", attributes:[NSForegroundColorAttributeName: UIColor.redColor(),NSFontAttributeName :UIFont(name: "Arial", size: 14)!])
            flag = false
            
        }
        
        if( length <= 9 && phoneNumber.text != "" && phoneNumber.text != nil) {
            phoneNumber.text = ""
            phoneNumber.attributedPlaceholder = NSAttributedString(string:"Please enter 10 digit", attributes:[NSForegroundColorAttributeName: UIColor.redColor(),NSFontAttributeName :UIFont(name: "Arial", size: 14)!])
            flag = false
        }
        
        if (message.text.isEmpty || message.textColor == UIColor.grayColor().colorWithAlphaComponent(0.5) || message.textColor == UIColor.redColor()) {
            message.textColor = UIColor.redColor()
            message.text = "Please enter message"
            message.font = UIFont(name: "OpenSans", size: 14)
            flag = false
        }
        
        return flag
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
