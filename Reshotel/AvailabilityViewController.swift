//
//  AvailabilityViewController.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/19/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class AvailabilityViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var navBarDate: UILabel!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var ratesAvailabilityTableView: UITableView!
    @IBOutlet weak var showCalendarView: UIView!
    @IBOutlet weak var customNavBarView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    var bookings = [Booking]()
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var flag = false
    var rateView = ratePlanView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.clipsToBounds = true
        self.calendar.headerHeight = 0.0
        self.calendar.weekdayHeight = 30.0
        self.calendar.scope = .Week
        
        rateView = (NSBundle.mainBundle().loadNibNamed("ratePlanView", owner: self, options: nil).first as? ratePlanView)!
        // Hide empty row from table
        
        self.ratesAvailabilityTableView.tableFooterView = UIView(frame: CGRectZero)
        self.ratesAvailabilityTableView.estimatedRowHeight = 110
        self.ratesAvailabilityTableView.rowHeight = UITableViewAutomaticDimension
        // Add gesture on month nav to show full calendar view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AvailabilityViewController.openFullCalendar))
        tapGesture.cancelsTouchesInView = true
        showCalendarView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }

//    func onShowHideRatingActionAtIndex(index:Int ,status:String, flag:Bool)
//    {
//        self.ratesAvailabilityTableView.beginUpdates()
//        if (status == "onHideAction") {
//            // Update cell height on selected Index =  "index"
//            let cell = ratesAvailabilityTableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
//            cell?.contentView.frame.size.height = 110
//            
//        }else{
//            // Update cell height on selected Index =  "index"
//            let cell = ratesAvailabilityTableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
//            cell?.contentView.frame.size.height = 300
//        }
//        // reload selected UITableViewCell
//        self.ratesAvailabilityTableView.endUpdates()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.tintColor = greenColor
        calendar.selectDate(appDelegate.selectedDate!)
        self.navBarDate.text = calendar.stringFromDate(appDelegate.selectedDate!, format: "MMM yyyy")
    }
    
    func openFullCalendar() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dash:FullCalendarShowViewController = storyBoard.instantiateViewControllerWithIdentifier("FullCalendarShowViewController") as! FullCalendarShowViewController
        self.navigationController?.pushViewController(dash, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! AvailabilityTableViewCell
        let cellHeight = cell.getCellHeightForRowAtIndexPath(indexPath, tableView: ratesAvailabilityTableView, viewController: self)
        print("cell height : \(cellHeight)")
        return cellHeight
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Rates/Availability"
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ratesAvailabilityTableView.dequeueReusableCellWithIdentifier("Cell") as! AvailabilityTableViewCell
        cell.controller = self
        //cell.delegate = self
        cell.tag = indexPath.row
        var xyz:CGFloat = 90.0
        for _ in 1...2 {
            //rateView.ratePlanPrice.tag = counter
            rateView.frame = CGRectMake(0, xyz, cell.frame.size.width, 40)
            cell.contentView.addSubview(rateView)
            xyz += 40
        }
        //cell.booking = bookings[indexPath.row]
        return cell
    }
    
    
    @IBAction func settingsButtonAction(sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dash:SettingsViewController = storyBoard.instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(dash, animated: true)
    }
    
    // For autoLayout
    
    func calendar(calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraint.constant = CGRectGetHeight(bounds)
        self.view!.layoutIfNeeded()
    }
    
    func calendar(calendar: FSCalendar, didSelectDate date: NSDate) {
        appDelegate.selectedDate = date
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
