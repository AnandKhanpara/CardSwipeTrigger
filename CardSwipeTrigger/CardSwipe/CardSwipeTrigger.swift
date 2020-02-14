//
//  CardSwipeTrigger.swift
//  CardSwipeTrigger
//
//  Created by Anand Khanpara on 13/02/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import Foundation
import UIKit

public class CardSwipeTrigger: NSObject {
    
    public static func addCards(arrView:[[UIView:Any]], superview:UIView, delegate:CardSwipeTriggerDelegate?, swipeLevel:SwipeLevel = .medium) {
        CardSwipeTriggerAccess.cardSwipe(arrView: arrView, superview: superview, delegate: delegate, swipeLevel: swipeLevel)
    }
    
    public static func cardSwipeShake() {
        CardSwipeTriggerAccess.cardSwipeShake()
    }
    
    public static func cardLeftSwipe() {
        CardSwipeTriggerAccess.cardLeftSwipe()
    }
    
    public static func cardRightSwipe() {
        CardSwipeTriggerAccess.cardRightSwipe()
    }
}
