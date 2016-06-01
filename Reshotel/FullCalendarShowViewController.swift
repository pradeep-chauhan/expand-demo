//
//  FullCalendarShowViewController.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/19/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class FullCalendarShowViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet weak var calendar: FSCalendar!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.scope = .Month
        self.calendar.scrollDirection = .Vertical
        self.calendar.allowsMultipleSelection = true
        self.calendar.clipsToBounds = true
        self.calendar.headerHeight = 0.0
        self.calendar.appearance.weekdayTextColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeCalendar(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func calendar(calendar: FSCalendar, didSelectDate date: NSDate) {
        appDelegate.selectedDate = date
        self.navigationController?.popViewControllerAnimated(true)
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
