//
//  Rushee.swift
//  Bid-em
//
//  Created by Killian Jackson on 2/25/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import Foundation

class Rushee {
    private var _firstName: String!
    private var _lastName: String!
    private var _year: Int!
    private var _major: String!
    private var _email: String!
    private var _phoneNumber: String!
    private var _imageURL: String!
    private var _rating: Double!
    
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
    
    init(firstName: String, lastName: String, year: Int, major: String, email: String, phoneNumber: String) {
        self._firstName = firstName
        self._lastName = lastName
        self._year = year
        self._major = major
        self._email = email
        self._phoneNumber = phoneNumber
    }
    
}
