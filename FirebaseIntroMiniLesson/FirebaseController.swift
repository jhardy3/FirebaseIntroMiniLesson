//
//  FirebaseController.swift
//  FirebaseIntroMiniLesson
//
//  Created by Jake Hardy on 2/29/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase


class FirebaseController {
    
    static let firebase = Firebase(url: "https://local-restaurant.firebaseio.com/")
    static let restaurantRef = firebase.childByAppendingPath("Restaurants")
    
}