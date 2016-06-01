//
//  BookingDetailsViewController.swift
//  Reshotel
//
//  Created by Pradeep Chauhan on 5/26/16.
//  Copyright © 2016 Pradeep Chauhan. All rights reserved.
//

import UIKit

class BookingDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var bookingDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = greenColor
        self.navigationItem.title = "Joy Full Palace"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let FirstCell = collectionView.dequeueReusableCellWithReuseIdentifier("FirstCell", forIndexPath: indexPath)
            return FirstCell
        }
        else if indexPath.row == 1 {
            let SecondCell = collectionView.dequeueReusableCellWithReuseIdentifier("SecondCell", forIndexPath: indexPath)
            return SecondCell
        }
        if indexPath.row == 2 {
            let ThirdCell = collectionView.dequeueReusableCellWithReuseIdentifier("ThirdCell", forIndexPath: indexPath)
            return ThirdCell
        }
        else {
            let FourthCell = collectionView.dequeueReusableCellWithReuseIdentifier("FourthCell", forIndexPath: indexPath)
            return FourthCell
        }
        
        //let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        // Configure the cell
        
        //return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // Adjust cell size for orientation
        if (indexPath.row == 0) {
            return CGSize(width: collectionView.frame.width - 16, height: 90.0)
        }
        if (indexPath.row == 1) {
            return CGSize(width: collectionView.frame.width - 16, height: 107.0)
        }
        if (indexPath.row == 2) {
            return CGSize(width: collectionView.frame.width - 16, height: 60.0)
        }
        if indexPath.row == 3 {
            var height = heightForView("Cancellation policy Cancellation policy Cancellation policy Cancellation policy", width: collectionView.frame.width - 16)
            if (height < collectionView.frame.height - 257.0) {
                height = collectionView.frame.height - 257.0
            }
            return CGSize(width: collectionView.frame.width - 16, height: height)
        }
        else {
            return CGSize(width: collectionView.frame.width - 16, height: 0.0)
        }
    }
    
    // calculation string height
    
    func heightForView(text:String, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
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
