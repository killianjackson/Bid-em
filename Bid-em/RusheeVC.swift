//
//  ViewController.swift
//  Bid-em
//
//  Created by Killian Jackson on 2/24/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit

class RusheeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var rushees: [Rushee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rushees.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let rushee = rushees[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("RusheeCell") as? RusheeCell {
            cell.configureCell(rushee)
            return cell
        } else {
            return RusheeCell()
        }
    }



}

