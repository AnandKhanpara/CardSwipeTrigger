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
    func cardSwipeContinue(cardView:CardSwipeTriggerView, leftSwipe:Bool, rightSwipe:Bool, transfor:CGFloat, details:Any?)
    func cardSwipeDidEndLeftSwipe(cardView:CardSwipeTriggerView, details:Any?)
    func cardSwipeDidEndRightSwipe(cardView:CardSwipeTriggerView, details:Any?)
    func cardSwipeLoadingAddSuperview(cardAddPercentage:CGFloat)
}

extension CardSwipeTriggerDelegate {
    func cardSwipeContinue(cardView:CardSwipeTriggerView, leftSwipe:Bool, rightSwipe:Bool, transfor:CGFloat, details:Any?) {}
    func cardSwipeDidEndLeftSwipe(cardView:CardSwipeTriggerView, details:Any?) {}
    func cardSwipeDidEndRightSwipe(cardView:CardSwipeTriggerView, details:Any?) {}
    func cardSwipeAddSuperViewLoading(cardAddPercentage:CGFloat) {}
}
