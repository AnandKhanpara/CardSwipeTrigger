//
//  CardSwipeTriggerExtension.swift
//  CardSwipeTrigger
//
//  Created by Anand Khanpara on 13/02/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func topConstriant(superView:UIView, topConstant:CGFloat = 0, topIsActive:Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = self.topAnchor.constraint(equalTo: superView.topAnchor, constant: topConstant)
        topAnchor.isActive = topIsActive
        return topAnchor
    }
    
    func leadingConstriant(superView:UIView, leadingConstant:CGFloat = 0, leadingIsActive:Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let leadingAnchor = self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leadingConstant)
        leadingAnchor.isActive = leadingIsActive
        return leadingAnchor
    }
    
    func trailingConstriant(superView:UIView, trailingConstant:CGFloat = 0, trailingIsActive:Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let trailingAnchor = self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailingConstant)
        trailingAnchor.isActive = trailingIsActive
        return trailingAnchor
    }
    
    func bottomConstriant(superView:UIView, bottomConstant:CGFloat = 0, bottomIsActive:Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let bottomAnchor = self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottomConstant)
        bottomAnchor.isActive = bottomIsActive
        return bottomAnchor
    }
    
    func addBounds(superView:UIView,
                   topAdd:Bool = true, topConstant:CGFloat = 0, topIsActive:Bool = true,
                   leadingAdd:Bool = true, leadingConstant:CGFloat = 0, leadingIsActive:Bool = true,
                   trailingAdd:Bool = true, trailingConstant:CGFloat = 0, trailingIsActive:Bool = true,
                   bottomAdd:Bool = true, bottomConstant:CGFloat = 0, bottomIsActive:Bool = true) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if topAdd == true {
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: topConstant).isActive = topIsActive
        }
        if leadingAdd == true {
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leadingConstant).isActive = leadingIsActive
        }
        if trailingAdd == true {
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailingConstant).isActive = trailingIsActive
        }
        if bottomAdd == true {
             self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottomConstant).isActive = bottomIsActive
        }
    }
    
    func addBoundShadow(shadowPath path:CGPath? = nil, shadowRadius radius:CGFloat = 10, shadowColor color:UIColor = .black, shadowOpacity opacity:Float = 0.3, shadowOffset offset:CGSize = .zero) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0125) {
            self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            self.layer.shadowPath =  path ?? UIBezierPath(rect: self.bounds).cgPath
            self.layer.shadowRadius = radius
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOffset = offset
            self.layer.shadowOpacity = opacity
        }
    }
}


extension UIImage {
    
    func resize(_ size: CGSize?, base width:CGFloat = 300) -> UIImage? {
        guard let size = size else { return nil }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: CGFloat(size.height * width / size.width)),true, 1)
        let rect = CGRect(x: 0, y: 0, width: width, height: CGFloat(size.height * width / size.width))
        self.draw(in: rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return newImage
    }
}
