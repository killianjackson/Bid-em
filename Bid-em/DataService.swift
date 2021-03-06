//
//  DataService.swift
//  social-network
//
//  Created by Killian Jackson on 1/31/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://bid-em.firebaseio.com"

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
    private var _REF_RUSHEES = Firebase(url: "\(URL_BASE)/rushees")
    private var _REF_COMMENTS = Firebase(url: "\(URL_BASE)/comments")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_RUSHEES: Firebase {
        return _REF_RUSHEES
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS
    }
    
    var REF_COMMENTS: Firebase {
        return _REF_COMMENTS
    }
    
    var REF_USER_CURRENT: Firebase {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        let user = Firebase(url: "\(URL_BASE)").childByAppendingPath("users").childByAppendingPath(uid)
        return user!
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USERS.childByAppendingPath(uid).setValue(user) // grab a reference to that path. If it doesn't exist doesn't matter because we will create it when we save it
        // automatically updates in Firebase
        
    }
    
    func createCommentThread(rusheeID: String, comment: Dictionary<String, String>){
        REF_COMMENTS.childByAppendingPath(rusheeID).setValue(comment)
    }
    
}