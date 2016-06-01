//
//  AvailabilityTableViewCell.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/25/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit


//protocol AvailabilityTableViewCellDelegate {
////    func onShowHideRatingActionAtIndex()
//    func onShowHideRatingActionAtIndex(index:Int ,status:String, flag:Bool)
//
//}

class AvailabilityTableViewCell: UITableViewCell, UITextFieldDelegate {

    //var delegate: AvailabilityTableViewCellDelegate?
    var controller: AvailabilityViewController?
    
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var showRatesView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var roomTypeLabel: UILabel!
    @IBOutlet weak var showRatesLabel: UILabel!
    @IBOutlet weak var showRatesImage: UIImageView!
    @IBOutlet weak var increaseRoomCapacityButton: UIButton!
    @IBOutlet weak var decreaseRoomCapacityButton: UIButton!
    @IBOutlet weak var roomsAvailableTextField: UITextField!
    
    var rateView = ratePlanView()
    let dash = AvailabilityViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
            updateCell()
            // Add gesture on month nav to show full calendar view
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AvailabilityTableViewCell.showHideRatePlansAction))
            tapGesture.cancelsTouchesInView = true
            showRatesView.addGestureRecognizer(tapGesture)
        rateView = (NSBundle.mainBundle().loadNibNamed("ratePlanView", owner: self, options: nil).first as? ratePlanView)!
        rateView.ratePlanPrice.delegate = self
        
        // Initialization code
    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    var booking:Booking? {
        didSet {
            updateCell()
        }
    }
    
    func updateCell() {
        
        // enable and desable button
        updateNoOfRoom()
        
        stepperView.layer.borderWidth = 1
        stepperView.layer.borderColor = UIColor.grayColor().CGColor
        stepperView.layer.cornerRadius = 5
        
        increaseRoomCapacityButton.backgroundColor = UIColor.clearColor()
        increaseRoomCapacityButton.layer.cornerRadius = 5
        increaseRoomCapacityButton.layer.borderWidth = 0
        increaseRoomCapacityButton.layer.borderColor = UIColor.grayColor().CGColor
        
        decreaseRoomCapacityButton.backgroundColor = UIColor.clearColor()
        decreaseRoomCapacityButton.layer.cornerRadius = 5
        decreaseRoomCapacityButton.layer.borderWidth = 0
        decreaseRoomCapacityButton.layer.borderColor = UIColor.grayColor().CGColor
        
        roomsAvailableTextField.layer.borderColor = UIColor.grayColor().CGColor
        roomsAvailableTextField.layer.borderWidth = 1
        roomsAvailableTextField.layer.masksToBounds = true
    }
    
    func showHideRatePlansAction() {
        if self.controller?.flag == false {
            self.controller?.flag = true
            showRatesLabel.text = "Hide rates"
            showRatesImage.image = UIImage(named: "up-arrow-icon")
            //showHideRatePlans()
            //delegate?.onShowHideRatingActionAtIndex(self.tag , status: "onShowAction", flag:true)

        }
        else {
            self.controller?.flag = false
            showRatesLabel.text = "Show rates"
            showRatesImage.image = UIImage(named: "down-arrow-icon")
            //showHideRatePlans()
            //delegate?.onShowHideRatingActionAtIndex(self.tag , status: "onHideAction", flag:false)
        }
        print(self.controller?.flag)
        self.controller?.ratesAvailabilityTableView.beginUpdates()
        let indexPath = NSIndexPath(forRow: tag, inSection: 0)
        self.controller?.ratesAvailabilityTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        self.controller?.ratesAvailabilityTableView.endUpdates()
        
    }
    
    func showHideRatePlans() {
        
        if (self.controller?.flag == true) {
            var xyz:CGFloat = 10.0
            for _ in 1...2 {
                //rateView.ratePlanPrice.tag = counter
                rateView.frame = CGRectMake(0, 0, self.frame.size.width, 40)
                self.contentView.addSubview(rateView)
                xyz += 40
            }
            //self.frame.size.height = 110 + xyz
        }
        else {
            for _ in 1...2 {
                rateView.removeFromSuperview()
            }
        }
        
    }
    
    // Calculate each cell height
    
    func getCellHeightForRowAtIndexPath(indexpath:NSIndexPath, tableView:UITableView, viewController:UIViewController) -> CGFloat {
        
        if (self.controller?.flag == true) {
            var height:CGFloat = 110.0
            for _ in 1...2 {
                height +=  40
            }
            return height
        }
        else {
            return 110.0
        }
    }

    @IBAction func increaseRoomCapacityAction(sender: AnyObject) {
        let noOfRooms = roomsAvailableTextField.text
        let TotalRooms = Int(noOfRooms!)
        roomsAvailableTextField.text = "\(TotalRooms! + 1)"
        updateNoOfRoom()
    }
    
    @IBAction func decreaseRoomCapacityAction(sender: AnyObject) {
        let noOfRooms = roomsAvailableTextField.text
        let TotalRooms = Int(noOfRooms!)
        roomsAvailableTextField.text = "\(TotalRooms! - 1)"
        updateNoOfRoom()
    }
    
    func updateNoOfRoom() {
        
        if (roomsAvailableTextField.text == "0") {
            decreaseRoomCapacityButton.enabled = false
        }
        else {
            decreaseRoomCapacityButton.enabled = true
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print(textField.tag)
    }
}
