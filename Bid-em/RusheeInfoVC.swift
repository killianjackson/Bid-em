//
//  RusheeInfoVC.swift
//  Bid-em
//
//  Created by David Scheibe on 3/8/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class RusheeInfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var majorLbl: UILabel?
    @IBOutlet weak var nameLbl: UILabel?
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var yearLbl: UILabel?
    @IBOutlet weak var emailLbl: UILabel?
    @IBOutlet weak var phoneLbl: UILabel?
    @IBOutlet weak var rusheeImg: UIImageView?
    @IBOutlet weak var ratingImg1: UIImageView?
    @IBOutlet weak var ratingImg2: UIImageView?
    @IBOutlet weak var ratingImg3: UIImageView?
    @IBOutlet weak var ratingImg4: UIImageView?
    @IBOutlet weak var ratingImg5: UIImageView?
    @IBOutlet weak var commentTableView: UITableView!
    
    var rushee : Rushee!
    var comments = [Comment]()
    var commentRating = 0
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        //submit.layer.cornerRadius = 5
        
        nameLbl!.text = rushee.fullName
        majorLbl!.text = rushee.major
        switch rushee.year {
        case 1: yearLbl!.text = "Freshman"
        case 2: yearLbl!.text = "Sophomore"
        case 3: yearLbl!.text = "Junior"
        case 4: yearLbl!.text = "Senior"
        case 5: yearLbl!.text = "Senior"
        default: yearLbl!.text = "N/A"
        }
        phoneLbl!.text = rushee.phoneNumber
        emailLbl!.text = rushee.email
        rusheeImg!.layer.cornerRadius = rusheeImg!.frame.size.width / 2
        rusheeImg!.clipsToBounds = true
        rusheeImg!.clipsToBounds = true
        
        _ = Alamofire.request(.GET, rushee.imageURL).validate(contentType: ["image/*"]).response(completionHandler: { request, response, data, err in
            if err == nil {
                let img = UIImage(data: data!)!
                self.rusheeImg!.image = img
            } else {
                print(err.debugDescription)
            }
        })
        
        switch rushee.rating {
        case 0:
            ratingImg1!.image = UIImage(named: "emptyBowTie")
            ratingImg2!.image = UIImage(named: "emptyBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 0.5:
            ratingImg1!.image = UIImage(named: "halfBowTie")
            ratingImg2!.image = UIImage(named: "emptyBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 1:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "emptyBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 1.5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "halfBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 2:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 2.5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "halfBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 3:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 3.5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "halfBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 4:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "filledBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 4.5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "filledBowTie")
            ratingImg5!.image = UIImage(named: "halfBowTie")
        case 5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "filledBowTie")
            ratingImg5!.image = UIImage(named: "filledBowTie")
        default:
            ratingImg1!.image = UIImage(named: "emptyBowTie")
            ratingImg2!.image = UIImage(named: "emptyBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        }
        
        DataService.ds.REF_COMMENTS.observeEventType(.Value, withBlock: { snapshot in
            self.comments = [] // clear out posts each time there is a change because we are going to completely update the data
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots {
                    if snap.key == self.rushee.rusheeKey {
                    if let commentSnapDict = snap.value as? Dictionary<String, String> {
                        let tempComments = commentSnapDict["comments"]!
                        print("tempComments: \(tempComments)")
                        let tempRatings = commentSnapDict["ratings"]!
                        let tempUsernames = commentSnapDict["usernames"]!
                        var commentsArr = tempComments.componentsSeparatedByString("|")
                        var ratingsArr = tempRatings.componentsSeparatedByString("|")
                        var usernamesArr = tempUsernames.componentsSeparatedByString("|")
                        let len = commentsArr.count
                        for i in 0...len-1 {
                            let comment = Comment(comment: commentsArr[i], commenterName: usernamesArr[i], rating: ratingsArr[i])
                            self.comments.append(comment)
                        }
                        }
                    }
                }
            }
            
            self.commentTableView.reloadData()
        })
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell") as? commentCell {
            
            let comment = comments[indexPath.row]
            cell.configureCell(comment)
            return cell
            

        } else {
            return commentCell()
        }
        
    }



    @IBAction func btnSubmit(sender: AnyObject) {
        
        DataService.ds.REF_USER_CURRENT.observeEventType(.Value, withBlock: { snapshot in
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots {
                    let tempString = snap.value as! String
                    if tempString != "facebook" {
                        let tempUsername = tempString
                        DataService.ds.REF_COMMENTS.observeEventType(.Value, withBlock: { snapshot2 in
                            if let snapshots2 = snapshot2.children.allObjects as? [FDataSnapshot] {
                                for snap2 in snapshots2 {
                                    if snap2.key == self.rushee.rusheeKey {
                                       if let commentSnap = snap2.value as? Dictionary<String, String> {
                                        if self.commentTextField.text != "" {
                                            self.rushee.addRating(Double(self.commentRating))
                                            var tempComments = commentSnap["comments"]!
                                            var tempRatings = commentSnap["ratings"]!
                                            var tempUsernames = commentSnap["usernames"]!
                                            tempComments = "\(tempComments)|\(self.commentTextField.text!)"
                                            tempRatings = "\(tempRatings)|\(self.commentRating)"
                                            tempUsernames = "\(tempUsernames)|\(tempUsername)"
                                            self.postToFirebase(tempUsernames, comments: tempComments, rating: tempRatings)
                                            self.configureRatings(self.rushee.rating)

                                            }
                                        }
                                    } else {
                                        if self.commentTextField.text != "" {
                                        self.postToFirebase(tempUsername, comments: self.commentTextField.text!, rating: String(self.commentRating))
                                        self.configureRatings(self.rushee.rating)
                                        }
                                    }
                                }
                            }
                        })
                        
                    }
                }
                
            }
        
        })
        commentTextField.endEditing(true)
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func postToFirebase(username: String!, comments: String!, rating: String!) {
        let post: Dictionary<String, String> = [
            "usernames" : username, "comments" : comments, "ratings": rating]
        
        let firebasePost = DataService.ds.REF_COMMENTS.childByAppendingPath(rushee.rusheeKey)
        firebasePost.setValue(post)
        
        commentTextField!.text = ""
        let image = UIImage(named: "emptyBowTie")
        ratingBtn.setImage(image, forState: .Normal)
    }
    
    func configureRatings (rating: Double){
        switch rating {
        case 0:
            ratingImg1!.image = UIImage(named: "emptyBowTie")
            ratingImg2!.image = UIImage(named: "emptyBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 0.5:
            ratingImg1!.image = UIImage(named: "halfBowTie")
            ratingImg2!.image = UIImage(named: "emptyBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 1:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "emptyBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 1.5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "halfBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 2:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 2.5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "halfBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 3:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 3.5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "halfBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 4:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "filledBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        case 4.5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "filledBowTie")
            ratingImg5!.image = UIImage(named: "halfBowTie")
        case 5:
            ratingImg1!.image = UIImage(named: "filledBowTie")
            ratingImg2!.image = UIImage(named: "filledBowTie")
            ratingImg3!.image = UIImage(named: "filledBowTie")
            ratingImg4!.image = UIImage(named: "filledBowTie")
            ratingImg5!.image = UIImage(named: "filledBowTie")
        default:
            ratingImg1!.image = UIImage(named: "emptyBowTie")
            ratingImg2!.image = UIImage(named: "emptyBowTie")
            ratingImg3!.image = UIImage(named: "emptyBowTie")
            ratingImg4!.image = UIImage(named: "emptyBowTie")
            ratingImg5!.image = UIImage(named: "emptyBowTie")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RatingSegue" {
            let popoverViewController = segue.destinationViewController as! RatingVC
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
    
}


