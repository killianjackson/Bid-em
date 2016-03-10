//
//  Comment.swift
//  Bid-em
//
//  Created by David Scheibe on 3/9/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import Foundation
import Firebase

class Comment {
    private var _comment: String!
    private var _commenterName: String!
    private var _rating: Double!
    private var _commentKey: String!
    private var _commentRef: Firebase!
    
    var comment: String {
        return _comment
    }
    
    var rating: Double {
        return _rating
    }
    
    var commenterName: String {
        return _commenterName
    }
    
    init(comment: String, commenterName: String, rating: String)
    {
        self._comment = comment
        self._commenterName = commenterName
        let trimmedRating = rating.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        self._rating = Double(trimmedRating)
    }
    
    init(commentKey: String, dictionary: Dictionary<String, AnyObject>) {
        self._commentKey = commentKey
        self._commentRef = DataService.ds.REF_COMMENTS.childByAppendingPath(self._commentKey)
        if let comment = dictionary["comment"] as? String {
            self._comment = comment
        }
        
        if let commenterName = dictionary["commenterName"] as? String {
            self._commenterName = commenterName
        }
        
        if let rating = dictionary["rating"] as? Double {
            self._rating = rating
        }
    }
}