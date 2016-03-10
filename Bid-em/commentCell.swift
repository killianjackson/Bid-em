//
//  commentCell.swift
//  Bid-em
//
//  Created by David Scheibe on 3/9/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit

class commentCell: UITableViewCell {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var ratingImg1: UIImageView!
    @IBOutlet weak var ratingImg2: UIImageView!
    @IBOutlet weak var ratingImg3: UIImageView!
    @IBOutlet weak var ratingImg4: UIImageView!
    @IBOutlet weak var ratingImg5: UIImageView!
    
    var comment : Comment!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userInteractionEnabled = false
    }

    
    func configureCell(comment: Comment) {
        self.comment = comment
        
        self.usernameLbl.text = comment.commenterName
        self.commentLbl.text = comment.comment
        print("here")
        print(comment.comment)
        
        
        switch comment.rating {
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
