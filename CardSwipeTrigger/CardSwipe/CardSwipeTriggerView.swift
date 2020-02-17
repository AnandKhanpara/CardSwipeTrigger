//
//  CardSwipeTriggerView.swift
//  CardSwipeTrigger
//
//  Created by Anand Khanpara on 13/02/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import UIKit

public class CardSwipeTriggerView: UIView, UIGestureRecognizerDelegate {
    
    var mainView = UIView()
    var details:Any? = nil
    var indexTag:Int = 0
    var topAnchorConstraint = NSLayoutConstraint()
    var leadingAnchorConstraint = NSLayoutConstraint()
    var trailingAnchorConstraint = NSLayoutConstraint()
    var bottomAnchorConstraint = NSLayoutConstraint()
    
    var x:CGFloat = 0
    var y:CGFloat = 0
    
    var x1:CGFloat = 0
    var y1:CGFloat = 0
    //Trigger
    var xCenter:CGFloat = 0
    var xStart:CGFloat = 0
    
    var firstViewLocation:CGPoint = CGPoint()
    var lastViewLocation:CGPoint = CGPoint()
    var viewXTrnasform:CGFloat = 0
    var angle:CGFloat = 0
    
    var tx:CGFloat = 0
    var ty:CGFloat = 0
    
    var delegate:CardSwipeTriggerDelegate?
    
    var swipeLevel:SwipeLevel = .medium
    
    init(frame: CGRect = CGRect(), addSubView:UIView? = nil, details:Any? = nil, swipeLevel:SwipeLevel = .medium, indexTag:Int) {
        super.init(frame: frame)
        
        DispatchQueue.main.async {
            
            self.indexTag = indexTag
            self.swipeLevel = swipeLevel
            self.details = details
            self.mainView = self.superview ?? UIView()
            self.frame = self.mainView.bounds
            
            let viewCard = UIView()
            viewCard.backgroundColor = .white
            viewCard.clipsToBounds = true
            viewCard.layer.cornerRadius = 0
            self.addSubview(viewCard)
            self.topAnchorConstraint = viewCard.topConstriant(superView: self, topConstant: 20)
            self.bottomAnchorConstraint = viewCard.bottomConstriant(superView: self)
            self.leadingAnchorConstraint = viewCard.leadingConstriant(superView: self, leadingConstant: 20)
            self.trailingAnchorConstraint = viewCard.trailingConstriant(superView: self, trailingConstant: -20)
            //viewCard.addBounds(superView: self, topAdd: false, bottomAdd: false)
            
            if let subview = addSubView {
                viewCard.layer.cornerRadius = subview.layer.cornerRadius
                viewCard.addSubview(subview)
                subview.addBounds(superView: viewCard)
                
            }
            
            self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            //self.backgroundColor = .red
            
            let pan = UIPanGestureRecognizer(target: self, action: #selector(self.panGesture))
            pan.delegate = self
            self.addGestureRecognizer(pan)
        }
    }
    
    @objc func panGesture(gesture:UIPanGestureRecognizer) {
        
        switch gesture.state {
            
        case .began:
            
            let firstLocation = gesture.location(in: self)
            firstViewLocation = gesture.location(in: self.mainView)
            xCenter = self.mainView.frame.size.width / 2
            x = self.frame.origin.x
            y = self.frame.origin.y
            x1 = firstLocation.x
            y1 = firstLocation.y
            xStart = xCenter - firstViewLocation.x
            
        case .changed:
            
            lastViewLocation = gesture.location(in: self.mainView)
            viewXTrnasform = (xCenter - (xStart + lastViewLocation.x))
            angle = -((viewXTrnasform * 0.3) / xCenter)
            
            tx = ((lastViewLocation.x - x) - x1)
            ty = ((lastViewLocation.y - y) - y1)

            if viewXTrnasform > 0 {
                self.transform = CGAffineTransform(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle), tx: tx , ty: ty).scaledBy(x: 1 - abs(angle), y: 1 - abs(angle))
            }else if viewXTrnasform == 0 {
                self.transform = CGAffineTransform(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle), tx: tx , ty: ty).scaledBy(x: 1 - abs(angle), y: 1 - abs(angle))
            }else {
                self.transform = CGAffineTransform(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle), tx: tx , ty: ty).scaledBy(x: 1 - abs(angle), y: 1 - abs(angle))
            }
            
            if firstViewLocation.x > lastViewLocation.x {
                delegate?.cardSwipeContinue(cardView: self, index: self.indexTag, leftSwipe: true, rightSwipe: false, transfor: 1 - abs(angle), details: self.details)
            }else if firstViewLocation.x < lastViewLocation.x {
                delegate?.cardSwipeContinue(cardView: self, index: self.indexTag, leftSwipe: false, rightSwipe: true, transfor: 1 - abs(angle), details: self.details)
            }
            
        case .ended:
            
            let removeLevel:CGFloat = self.swipeLevel == .low ? 0 : self.swipeLevel == .medium ? 100 : 200
            
            let moveTransform:CGFloat = self.mainView.frame.size.width
            let minimumXTransform:CGFloat = ((self.frame.size.width / 2) - removeLevel)
            
            if firstViewLocation.x > lastViewLocation.x {
                
                let xTransfrom = firstViewLocation.x - lastViewLocation.x
                
                if minimumXTransform < xTransfrom {
                    self.delegate?.cardSwipeDidEndLeftSwipe(cardView: self, index: self.indexTag, details: self.details)
                    self.transformSwipeContinue(tx: -moveTransform, ty: -100)
                }else {
                    delegate?.cardSwipeContinue(cardView: self, index: self.indexTag, leftSwipe: true, rightSwipe: false, transfor: 1, details: self.details)
                    self.transformIdentity()
                }
                
            }else if firstViewLocation.x < lastViewLocation.x {
                
                let xTransfrom = lastViewLocation.x - firstViewLocation.x
                
                if minimumXTransform < xTransfrom {
                    self.delegate?.cardSwipeDidEndRightSwipe(cardView: self, index: self.indexTag, details: self.details)
                    self.transformSwipeContinue(tx: moveTransform, ty: -100)
                }else {
                    delegate?.cardSwipeContinue(cardView: self, index: self.indexTag, leftSwipe: true, rightSwipe: false, transfor: 1, details: self.details)
                    self.transformIdentity()
                }
            }
            
        default:
            break
        }
    }
    
    private func transformSwipeContinue(tx:CGFloat, ty:CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(a: cos(self.angle), b: sin(self.angle), c: -sin(self.angle), d: cos(self.angle), tx: self.tx + tx, ty: self.ty - 100).scaledBy(x: 0.3, y: 0.3)
            self.layoutIfNeeded()
        }, completion: { _ in
            self.removeFromSuperview()
            CardSwipeTriggerAccess.findView(cardView: self)
        })
    }
    
    private func transformIdentity() {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: [], animations: {
            self.transform = .identity
            self.layoutIfNeeded()
        })
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("error to setup view1")
    }
}


public enum SwipeLevel {
    case low
    case medium
    case high
}
