//
//  RestaurantController.swift
//  FirebaseIntroMiniLesson
//
//  Created by Jake Hardy on 2/29/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import Firebase

public let RestaurantsUpdatedNotification = "RestaurantsUpdatedNotification"


class RestaurantController {
    
    static let shareController = RestaurantController()
    
    var restaurants: [Restaurant] {
        didSet {
            let notification = NSNotificationCenter.defaultCenter()
            notification.postNotificationName(RestaurantsUpdatedNotification, object: self)
        }
    }
    
    init() {
        self.restaurants = []
        loadRestaurants()
    }
    
    func loadRestaurants() {
        FirebaseController.restaurantRef.observeEventType(FEventType.Value, withBlock: { (snap) -> Void in
            
            for wholeRestaurant in snap.children {
                guard let restaurant = wholeRestaurant as? FDataSnapshot, let unwrappedRestaurant = restaurant.value as? [String : AnyObject], let aRestaurant = Restaurant(dictionary: unwrappedRestaurant) else { break }
                self.restaurants.append(aRestaurant)
            }
            
        })
    }
    
    func addRestaurant(restaurant: Restaurant) {
        let newRestaurantRef = FirebaseController.restaurantRef.childByAutoId()
        newRestaurantRef.setValue(restaurant.dictionaryCopy())
    }
    
    
}