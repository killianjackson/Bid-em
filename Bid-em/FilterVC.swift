//
//  FilterVC.swift
//  Bid-em
//
//  Created by Killian Jackson on 3/1/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {

    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    var senderVC: RusheeVC!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    @IBAction func btn1Pressed(sender: AnyObject) {
        senderVC.filterMode = 0
        senderVC.updateTableView()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btn2Pressed(sender: AnyObject) {
        senderVC.filterMode = 1
        senderVC.updateTableView()
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func btn3Pressed(sender: AnyObject) {
        senderVC.filterMode = 2
        senderVC.updateTableView()
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func btn4Pressed(sender: AnyObject) {
        senderVC.filterMode = 3
        senderVC.updateTableView()
        dismissViewControllerAnimated(true, completion: nil)
    }
}
