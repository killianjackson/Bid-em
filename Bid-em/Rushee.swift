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
    private var _imageURL: String!
    private var _rating: Double!
    private var _group: Int!
    private var _rusheeKey: String!
    private var _rusheeRef: Firebase!
    
    var firstName: String {
        return _firstName
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
        return _rating
    }
    
    var imageURL: String {
        return _imageURL
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
    
    init(firstName: String, lastName: String, year: Int, major: String, email: String, phoneNumber: String, rating: Double, imageURL: String, group: Int) {
        self._firstName = firstName
        self._lastName = lastName
        self._year = year
        self._major = major
        self._email = email
        self._phoneNumber = phoneNumber
        self._rating = rating
        self._group = group
        self._imageURL = imageURL
    }
    
    init(rusheeKey: String, dictionary:Dictionary<String, AnyObject>) {
        self._rusheeKey = rusheeKey
        
        if let email = dictionary["email"] as? String {
            self._email = email
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
        
        if let phoneNumber = dictionary["phoneNumber"] as? Int {
            self._phoneNumber = "\(phoneNumber)"
        }
        
        if let rating = dictionary["rating"] as? Double {
            self._rating = Double(rating)
        }
        
        if let year = dictionary["year"] as? Int {
            self._year = year
        }
        
        if let group = dictionary["group"] as? Int {
            self._group = group
        }
        
    }
    
}
