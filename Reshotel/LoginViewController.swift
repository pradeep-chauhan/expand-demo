//
//  LoginViewController.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/19/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.loginButton.backgroundColor = greenColor
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonAction(sender: AnyObject) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dash:DeshBoardTabBarViewController = storyBoard.instantiateViewControllerWithIdentifier("DeshBoardTabBarViewController") as! DeshBoardTabBarViewController
        self.navigationController?.pushViewController(dash, animated: true)
        
        
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
