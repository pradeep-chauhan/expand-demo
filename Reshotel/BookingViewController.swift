//
//  BookingViewController.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/19/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bookingTableView: UITableView!
    @IBOutlet weak var showCalendarView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var customNavBarView: UIView!
    @IBOutlet weak var navBarDate: UILabel!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FSCalendar delegate, data source and scope
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.scope = .Week
        self.calendar.clipsToBounds = true
        self.calendar.headerHeight = 0.0
        self.calendar.weekdayHeight = 30.0
        // Hide empty row from table
        
        self.bookingTableView.tableFooterView = UIView(frame: CGRectZero)
        
        
        // Add gesture on month nav to show full calendar view
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookingViewController.openFullCalendar))
        tapGesture.cancelsTouchesInView = true
        showCalendarView.addGestureRecognizer(tapGesture)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.tintColor = greenColor
        self.navigationItem.title = "Joy Full Palace"
        calendar.selectDate(appDelegate.selectedDate!)
        navBarDate.text = calendar.stringFromDate(appDelegate.selectedDate!, format: "MMM yyyy")
    }
    
    func openFullCalendar() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dash:FullCalendarShowViewController = storyBoard.instantiateViewControllerWithIdentifier("FullCalendarShowViewController") as! FullCalendarShowViewController
        self.navigationController?.pushViewController(dash, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Bookings"
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = bookingTableView.dequeueReusableCellWithIdentifier("Cell") as! BookingTableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dash:BookingDetailsViewController = storyBoard.instantiateViewControllerWithIdentifier("BookingDetailsViewController") as! BookingDetailsViewController
        self.navigationController?.pushViewController(dash, animated: true)
    }
    
    @IBAction func settingsButtonAction(sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dash:SettingsViewController = storyBoard.instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(dash, animated: true)
    }
    
    func calendar(calendar: FSCalendar, didSelectDate date: NSDate) {
        appDelegate.selectedDate = date
    }
    
    // For autoLayout
    
    func calendar(calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraint.constant = CGRectGetHeight(bounds)
        self.view!.layoutIfNeeded()
    }
    
    func calendarCurrentMonthDidChange(calendar: FSCalendar) {
        let month = calendar.stringFromDate(calendar.currentPage, format: "MMM yyyy")
        navBarDate.text = month
        appDelegate.selectedDate = calendar.currentPage
        
    }
    
    func calendarCurrentPageDidChange(calendar: FSCalendar) {
        let month = calendar.stringFromDate(calendar.currentPage, format: "MMM yyyy")
        navBarDate.text = month
        appDelegate.selectedDate = calendar.currentPage
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
