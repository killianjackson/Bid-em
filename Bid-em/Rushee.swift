//
//  Rushee.swift
//  Bid-em
//
//  Created by Killian Jackson on 2/25/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import Foundation
import Firebase

class Rushee {
    private var _firstName: String!
    private var _lastName: String!
    private var _year: Int!
    private var _major: String!
    private var _email: String!
    private var _phoneNumber: String!
    private var _imageURL: String?
    private var _sumRatings: Double!
    private var _group: Int!
    private var _rusheeKey: String!
    private var _rusheeRef: Firebase!
    private var _numRatings: Double!
    
    var firstName: String {
        return _firstName
    }
    
    var numRatings: Double {
        return _numRatings
    }
    
    var sumRatings: Double {
        return _sumRatings
    }
    
    var lastName: String {
        return _lastName
    }
    
    var year: Int {
        return _year
    }
    
    var major: String {
        return _major
    }
    
    var email: String {
        return _email
    }
    
    var phoneNumber: String {
        return _phoneNumber
    }
    
    var rating: Double {
        if (_sumRatings == 0 || _numRatings == 0){
            return 0
        } else {
            let curRating = _sumRatings / _numRatings
            print(curRating)
            if (curRating >= 0 && curRating < 0.5){
                return 0
            } else if (curRating >= 0.5 && curRating < 1){
                return 0.5
            }
            else if (curRating >= 1 && curRating < 1.5){
                return 1
            }
            else if (curRating >= 1.5 && curRating < 2){
                return 1.5
            }
            else if (curRating >= 2 && curRating < 2.5){
                return 2
            }
            else if (curRating >= 2.5 && curRating < 3){
                return 2.5
            }
            else if (curRating >= 3 && curRating < 3.5){
                return 3
            }
            else if (curRating >= 3.5 && curRating < 4){
                return 3.5
            }
            else if (curRating >= 4 && curRating < 4.5){
                return 4
            }
            else if (curRating >= 4.5 && curRating < 5){
                return 4.5
            }
            else if (curRating == 5){
                return 5
            }
        }
        return 0
    }
    
    var imageURL: String {
        if (_imageURL == nil){
            return "camera"
        } else {
        return _imageURL!
        }
    }
    
    var rusheeKey: String {
        return _rusheeKey
    }
    
    var fullName: String {
        let fullName = _firstName + " " + _lastName
        return fullName
    }
    
    var group: Int {
        return _group
    }
    
    func addRating(rating: Double){
        self._numRatings = self._numRatings + 1.0
        self._sumRatings = self._sumRatings + rating
        
        let firebasePost = DataService.ds.REF_RUSHEES.childByAppendingPath(self.rusheeKey).childByAppendingPath("numRatings")
        firebasePost.setValue(numRatings)
        let firebasePost2 = DataService.ds.REF_RUSHEES.childByAppendingPath(self.rusheeKey).childByAppendingPath("sumRatings")
        firebasePost2.setValue(sumRatings)
        
    }
    
    init(firstName: String, lastName: String, year: Int, major: String, email: String, phoneNumber: String, imageURL: String, group: Int, sumRatings: Double, numRatings: Double) {
        self._firstName = firstName
        self._lastName = lastName
        self._year = year
        self._major = major
        self._email = email
        self._phoneNumber = phoneNumber
        self._sumRatings = sumRatings
        self._numRatings = numRatings
        self._group = group
        self._imageURL = imageURL
    }
    
    init(rusheeKey: String, dictionary:Dictionary<String, AnyObject>) {
        self._rusheeKey = rusheeKey
        self._rusheeRef = DataService.ds.REF_RUSHEES.childByAppendingPath(self._rusheeKey)
        if let email = dictionary["email"] as? String {
            self._email = email
        }
        
        if let imageURL = dictionary["imageURL"] as? String {
            self._imageURL = imageURL
        }
        
        if let firstName = dictionary["firstName"] as? String {
            self._firstName = firstName
        }
        
        if let lastName = dictionary["lastName"] as? String {
            self._lastName = lastName
        }
        
        if let major = dictionary["major"] as? String {
            self._major = major
        }

        if let phoneNumber = dictionary["phoneNumber"] as? String {
            self._phoneNumber = phoneNumber
        }
        
        if let sumRatings = dictionary["sumRatings"] as? Double {
            self._sumRatings = sumRatings
        }
        
        if let numRatings = dictionary["numRatings"] as? Double {
            self._numRatings = numRatings
        }

        if let year = dictionary["year"] as? Int {
            self._year = year
        }
        
        if let group = dictionary["group"] as? Int {
            self._group = group
        }
        
    }
    
}
