//
//  RusheeCell.swift
//  Bid-em
//
//  Created by Killian Jackson on 2/25/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit

class RusheeCell: UITableViewCell {

    
    @IBOutlet weak var rusheeImg: UIImageView!
    @IBOutlet weak var rusheeNameLbl: UILabel!
    @IBOutlet weak var rusheeYearLbl: UILabel!
    @IBOutlet weak var rusheeMajorLbl: UILabel!
    
    @IBOutlet weak var ratingImg1: UIImageView!
    @IBOutlet weak var ratingImg2: UIImageView!
    @IBOutlet weak var ratingImg3: UIImageView!
    @IBOutlet weak var ratingImg4: UIImageView!
    @IBOutlet weak var ratingImg5: UIImageView!
    
    var rushee: Rushee!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func drawRect(rect: CGRect) {
        rusheeImg.layer.cornerRadius = rusheeImg.frame.size.width / 2
        rusheeImg.clipsToBounds = true
        rusheeImg.clipsToBounds = true
    }
    
    func configureCell (rushee: Rushee) {
        self.rusheeImg.image = UIImage(named: "bearwear")
        self.rushee = rushee
        self.rusheeNameLbl.text = rushee.firstName + " " + rushee.lastName
        switch rushee.year {
        case 1:
            self.rusheeYearLbl.text = "Freshman"
        case 2:
            self.rusheeYearLbl.text = "Sophomore"
        case 3:
            self.rusheeYearLbl.text = "Junior"
        case 4:
            self.rusheeYearLbl.text = "Senior"
        default:
            self.rusheeYearLbl.text = "\(rushee.year)"
        }
        self.rusheeMajorLbl.text = rushee.major
        switch rushee.rating {
        case 0:
            self.ratingImg1.image = UIImage(named: "emptyBowTie")
            self.ratingImg2.image = UIImage(named: "emptyBowTie")
            self.ratingImg3.image = UIImage(named: "emptyBowTie")
            self.ratingImg4.image = UIImage(named: "emptyBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 0.5:
            self.ratingImg1.image = UIImage(named: "halfBowTie")
            self.ratingImg2.image = UIImage(named: "emptyBowTie")
            self.ratingImg3.image = UIImage(named: "emptyBowTie")
            self.ratingImg4.image = UIImage(named: "emptyBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 1:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "emptyBowTie")
            self.ratingImg3.image = UIImage(named: "emptyBowTie")
            self.ratingImg4.image = UIImage(named: "emptyBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 1.5:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "halfBowTie")
            self.ratingImg3.image = UIImage(named: "emptyBowTie")
            self.ratingImg4.image = UIImage(named: "emptyBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 2:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "filledBowTie")
            self.ratingImg3.image = UIImage(named: "emptyBowTie")
            self.ratingImg4.image = UIImage(named: "emptyBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 2.5:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "filledBowTie")
            self.ratingImg3.image = UIImage(named: "halfBowTie")
            self.ratingImg4.image = UIImage(named: "emptyBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 3:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "filledBowTie")
            self.ratingImg3.image = UIImage(named: "filledBowTie")
            self.ratingImg4.image = UIImage(named: "emptyBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 3.5:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "filledBowTie")
            self.ratingImg3.image = UIImage(named: "filledBowTie")
            self.ratingImg4.image = UIImage(named: "halfBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 4:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "filledBowTie")
            self.ratingImg3.image = UIImage(named: "filledBowTie")
            self.ratingImg4.image = UIImage(named: "filledBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        case 4.5:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "filledBowTie")
            self.ratingImg3.image = UIImage(named: "filledBowTie")
            self.ratingImg4.image = UIImage(named: "filledBowTie")
            self.ratingImg5.image = UIImage(named: "halfBowTie")
        case 5:
            self.ratingImg1.image = UIImage(named: "filledBowTie")
            self.ratingImg2.image = UIImage(named: "filledBowTie")
            self.ratingImg3.image = UIImage(named: "filledBowTie")
            self.ratingImg4.image = UIImage(named: "filledBowTie")
            self.ratingImg5.image = UIImage(named: "filledBowTie")
        default:
            self.ratingImg1.image = UIImage(named: "emptyBowTie")
            self.ratingImg2.image = UIImage(named: "emptyBowTie")
            self.ratingImg3.image = UIImage(named: "emptyBowTie")
            self.ratingImg4.image = UIImage(named: "emptyBowTie")
            self.ratingImg5.image = UIImage(named: "emptyBowTie")
        }
        
    }

}
