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
    
    public static var cardSwipeLevel:SwipeLevel = .medium
    public static var delegate:CardSwipeTriggerDelegate?
    public static var dataSource:CardSwipeTriggerDataSource?
    public static var userFirstInteraction:Bool = true
   
    public static func cardSwipeShake() {
        CardSwipeTriggerAccess.cardSwipeShake()
    }
    
    public static func cardLeftSwipe() {
        CardSwipeTriggerAccess.cardLeftSwipe()
    }
    
    public static func cardRightSwipe() {
        CardSwipeTriggerAccess.cardRightSwipe()
    }
    
    public static func reload() {
        CardSwipeTriggerAccess.reload()
    }
}
