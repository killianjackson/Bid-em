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
        
        let testRushee1 = Rushee(firstName: "Killian", lastName: "Jackson:", year: 4, major: "Computer Science", email: "killianjackson@g.ucla.edu", phoneNumber: "(408)550-4855", rating: 4.5, imageURL: "test2.com")
        let testRushee2 = Rushee(firstName: "David", lastName: "Scheibe", year: 4, major: "Computer Science", email: "dscheibe@g.ucla.edu", phoneNumber: "(123)456-7890", rating: 3.5, imageURL: "test1.com")
        rushees.append(testRushee1)
        rushees.append(testRushee2)
        
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

