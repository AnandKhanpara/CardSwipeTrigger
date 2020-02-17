//
//  CardSwipeTriggerDataSource.swift
//  CardSwipeTrigger
//
//  Created by Anand Khanpara on 17/02/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import Foundation
import UIKit

public protocol CardSwipeTriggerDataSource {
    func numberOfCardSwipeTrigger() -> Int
    func cardSwipeSuperView() -> UIView
    func cardSwipe(index:Int) -> UIView
    func cardSwipeAddDetails(index:Int) -> Any
}

extension CardSwipeTriggerDataSource {
    func cardSwipeAddDetails(index:Int) -> Any? { return nil }
}
