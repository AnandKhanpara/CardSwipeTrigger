//
//  CardSwipeTriggerDelegate.swift
//  CardSwipeTrigger
//
//  Created by Anand Khanpara on 13/02/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import Foundation
import UIKit

public protocol CardSwipeTriggerDelegate : class {
    func cardSwipeContinue(cardView:CardSwipeTriggerView, index:Int, leftSwipe:Bool, rightSwipe:Bool, transfor:CGFloat)
    func cardSwipeDidEndLeftSwipe(cardView:CardSwipeTriggerView, index:Int)
    func cardSwipeDidEndRightSwipe(cardView:CardSwipeTriggerView, index:Int)
}

extension CardSwipeTriggerDelegate {
    func cardSwipeContinue(cardView:CardSwipeTriggerView, index:Int, leftSwipe:Bool, rightSwipe:Bool, transfor:CGFloat) {}
    func cardSwipeDidEndLeftSwipe(cardView:CardSwipeTriggerView, index:Int) {}
    func cardSwipeDidEndRightSwipe(cardView:CardSwipeTriggerView, index:Int) {}
}
