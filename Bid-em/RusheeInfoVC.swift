//
//  RusheeInfoVC.swift
//  Bid-em
//
//  Created by David Scheibe on 3/8/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit
import Alamofire

class RusheeInfoVC: UIViewController {

    @IBOutlet weak var majorLbl: UILabel?
    @IBOutlet weak var nameLbl: UILabel?
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var comment: UITextField?
    @IBOutlet weak var rating: UITextField?
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func btnSubmit(sender: AnyObject) {
        let commentText = comment?.text
        let ratingVal = Double((rating?.text)!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit.layer.cornerRadius = 5
        
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
        print(rushee.phoneNumber)
        phoneLbl!.text = rushee.phoneNumber
        emailLbl!.text = rushee.email
        
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
        
    }
}
