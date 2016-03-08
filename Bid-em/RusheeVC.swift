//
//  ViewController.swift
//  Bid-em
//
//  Created by Killian Jackson on 2/24/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit
import Firebase

class RusheeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterButton: MaterialButton!
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    var rushees = [Rushee]()
    var searchFilteredRushees = [Rushee]()
    var filteredRushees = [Rushee]()
    var inSearchMode = false
    var filterMode = 0;
    
    /*


    filterModes cases
    0 = all rushees
    1 = accepted bids
    2 = holding bids
    3 = declined bids
    4 = axed
    
    
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        
        // ".Value" fires anytime there is a change in the data or its children
        // snapshot is a "snapshot" of the data in Firebase
        DataService.ds.REF_RUSHEES.observeEventType(.Value, withBlock: { snapshot in
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                self.rushees = []
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    
                    if let rusheeDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let rushee = Rushee(rusheeKey: key, dictionary: rusheeDict)
                        self.rushees.append(rushee)
                    }
                    
                }
                
            }
            self.tableView.reloadData()
        })
        
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (inSearchMode){
            return searchFilteredRushees.count
        } else if filterMode != 0 {
            return filteredRushees.count
        }
        else {
            return rushees.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("RusheeCell") as? RusheeCell {
            
            let rushee : Rushee!
            
            if inSearchMode {
                rushee = searchFilteredRushees[indexPath.row]
            } else if filterMode != 0 {
                rushee = filteredRushees[indexPath.row]
            } else {
                rushee = rushees[indexPath.row]
            }
            cell.configureCell(rushee)
            return cell
        } else {
            return RusheeCell()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            if filterMode == 0 {
                searchFilteredRushees = rushees.filter({$0.fullName.lowercaseString.rangeOfString(lower) != nil})
            } else {
                searchFilteredRushees = filteredRushees.filter({$0.fullName.lowercaseString.rangeOfString(lower) != nil})
            }
            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "filterSegue" {
            let popoverViewController = segue.destinationViewController as! FilterVC
            popoverViewController.senderVC = self
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
            let popoverPresentationController = segue.destinationViewController.popoverPresentationController
            let sourceView = sender as? UIButton
            popoverPresentationController!.sourceRect = sourceView!.bounds
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func updateTableView() {
        filteredRushees = []
        switch filterMode {
        case 1:
            for rushee in rushees {
                if (rushee.group == 1) {
                    filteredRushees.append(rushee)
                }
            }
        case 2:
            for rushee in rushees {
                if (rushee.group == 2) {
                    filteredRushees.append(rushee)
                }
            }
        case 3:
            for rushee in rushees {
                if (rushee.group == 3) {
                    filteredRushees.append(rushee)
                }
            }
        case 4:
            for rushee in rushees {
                if (rushee.group == 4) {
                    filteredRushees.append(rushee)
                }
            }
        default: break
        }
        self.tableView.reloadData()
    }
}

