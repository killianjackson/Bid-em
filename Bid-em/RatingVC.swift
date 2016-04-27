//
//  RatingVC.swift
//  Bid-em
//
//  Created by Killian Jackson on 3/13/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit

class RatingVC: UIViewController {

    
    @IBOutlet weak var ratingBtn1: UIButton!
    @IBOutlet weak var ratingBtn2: UIButton!
    @IBOutlet weak var ratingBtn3: UIButton!
    @IBOutlet weak var ratingBtn4: UIButton!
    @IBOutlet weak var ratingBtn5: UIButton!
    
    
    var senderVC: RusheeInfoVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btn1Pressed(sender: AnyObject) {
        let image = UIImage(named: "filledBowTie")
        self.ratingBtn1.setImage(image, forState: .Normal)
        senderVC.ratingBtn.setImage(image, forState: .Normal)
        senderVC.commentRating = 1
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func btn2Pressed(sender: AnyObject) {
        let image = UIImage(named: "filledBowTie")
        self.ratingBtn1.setImage(image, forState: .Normal)
        self.ratingBtn2.setImage(image, forState: .Normal)
        senderVC.ratingBtn.setImage(image, forState: .Normal)
        senderVC.commentRating = 2
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btn3Pressed(sender: AnyObject) {
        let image = UIImage(named: "filledBowTie")
        self.ratingBtn1.setImage(image, forState: .Normal)
        self.ratingBtn2.setImage(image, forState: .Normal)
        self.ratingBtn3.setImage(image, forState: .Normal)
        senderVC.ratingBtn.setImage(image, forState: .Normal)
        senderVC.commentRating = 3
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btn4Pressed(sender: AnyObject) {
        let image = UIImage(named: "filledBowTie")
        self.ratingBtn1.setImage(image, forState: .Normal)
        self.ratingBtn2.setImage(image, forState: .Normal)
        self.ratingBtn3.setImage(image, forState: .Normal)
        self.ratingBtn4.setImage(image, forState: .Normal)
        senderVC.ratingBtn.setImage(image, forState: .Normal)
        senderVC.commentRating = 4
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btn5Pressed(sender: AnyObject) {
        let image = UIImage(named: "filledBowTie")
        self.ratingBtn1.setImage(image, forState: .Normal)
        self.ratingBtn2.setImage(image, forState: .Normal)
        self.ratingBtn3.setImage(image, forState: .Normal)
        self.ratingBtn4.setImage(image, forState: .Normal)
        self.ratingBtn5.setImage(image, forState: .Normal)
        senderVC.ratingBtn.setImage(image, forState: .Normal)
        senderVC.commentRating = 5
        dismissViewControllerAnimated(true, completion: nil)
    }

}
