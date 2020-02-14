//
//  CardSwipeTriggerAccess.swift
//  CardSwipeTrigger
//
//  Created by Anand Khanpara on 13/02/2020.
//  Copyright © 2020 Anand Khanpara. All rights reserved.
//

import Foundation
import UIKit

class CardSwipeTriggerAccess:NSObject {
    
    static var arrCardSwipeTrigger = [CardSwipeTriggerView]()
        
    static func findView(cardView:CardSwipeTriggerView) {
        DispatchQueue.main.async {
            if let index = CardSwipeTriggerAccess.arrCardSwipeTrigger.firstIndex(where: {$0 == cardView}) {
                CardSwipeTriggerAccess.arrCardSwipeTrigger.remove(at: index)
                CardSwipeTriggerAccess.rearrangeCardView()
            }
        }
    }
    
    static func firstTimeRearrangeCardView(userFirstInteraction:Bool = true) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            CardSwipeTriggerAccess.rearrangeCardView()
            if userFirstInteraction == true {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    CardSwipeTriggerAccess.firstTimeUserInteractionToInform()
                }
            }
        }
    }
    
    static func cardSwipe(arrView:[[UIView:Any]]? = nil, superview:UIView, delegate:CardSwipeTriggerDelegate?, swipeLevel:SwipeLevel = .medium, userFirstInteraction:Bool = true) {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                if var arrView = arrView {
                    arrView.reverse()
                    for i in 0..<arrView.count {
                        let customView = arrView[i]
                        let cardView = CardSwipeTriggerAccess.cardSwipe(addSubView: customView.keys.first, details: customView.values.first, delegate: delegate, superview: superview, swipeLevel: swipeLevel)
                        if (arrView.count - 1) == i  {
                            cardView.delegate?.cardSwipeLoadingAddSuperview(cardAddPercentage: CGFloat(100))
                            CardSwipeTriggerAccess.firstTimeRearrangeCardView(userFirstInteraction: userFirstInteraction)
                        }else {
                            cardView.delegate?.cardSwipeLoadingAddSuperview(cardAddPercentage: CGFloat((( i * 100 ) / (arrView.count - 1))))
                        }
                    }
                }
            }
        }
    }
    
    static func cardSwipeShake() {
        CardSwipeTriggerAccess.firstTimeUserInteractionToInform()
    }
    
    static func cardLeftSwipe() {
        CardSwipeTriggerAccess.leftSwipeRemove(cardView: CardSwipeTriggerAccess.arrCardSwipeTrigger.last)
    }
    
    static func cardRightSwipe() {
        CardSwipeTriggerAccess.rightSwipeRemove(cardView: CardSwipeTriggerAccess.arrCardSwipeTrigger.last)
    }
    
    static func leftSwipeRemove(cardView:CardSwipeTriggerView?) {
        
        guard let cardView = cardView else { return }
        
        let angle:CGFloat = -0.3
        let tx:CGFloat = -(cardView.superview?.frame.size.width ?? 0)
        let ty:CGFloat = 100
        
        UIView.animate(withDuration: 0.5, animations: {
            cardView.alpha = 0
            cardView.transform = CGAffineTransform(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle), tx: tx, ty: ty).scaledBy(x: 0.3, y: 0.3)
            cardView.layoutIfNeeded()
        }, completion: { _ in
            cardView.removeFromSuperview()
            cardView.delegate?.cardSwipeDidEndLeftSwipe(cardView: cardView, details: cardView.details)
            CardSwipeTriggerAccess.findView(cardView: cardView)
        })
    }
    
    static func rightSwipeRemove(cardView:CardSwipeTriggerView?) {
        
        guard let cardView = cardView else { return }
        
        let angle:CGFloat = 0.3
        let tx:CGFloat = (cardView.superview?.frame.size.width ?? 0)
        let ty:CGFloat = 100
        
        UIView.animate(withDuration: 0.5, animations: {
            cardView.alpha = 0
            cardView.transform = CGAffineTransform(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle), tx: tx, ty: ty).scaledBy(x: 0.3, y: 0.3)
            cardView.layoutIfNeeded()
        }, completion: { _ in
            cardView.removeFromSuperview()
            cardView.delegate?.cardSwipeDidEndRightSwipe(cardView: cardView, details: cardView.details)
            CardSwipeTriggerAccess.findView(cardView: cardView)
        })
    }
    
    static private func rearrangeCardView() {
            UIView.animate(withDuration: 0.3, animations: {
                let count = CardSwipeTriggerAccess.arrCardSwipeTrigger.count
                if count == 1 {
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].topAnchorConstraint.constant = 0
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].leadingAnchorConstraint.constant = 0
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].trailingAnchorConstraint.constant = 0
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].bottomAnchorConstraint.constant = -20
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].layoutIfNeeded()
                }else if count > 1 {
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].topAnchorConstraint.constant = 0
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].leadingAnchorConstraint.constant = 0
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].trailingAnchorConstraint.constant = 0
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].bottomAnchorConstraint.constant = -20
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 2].topAnchorConstraint.constant = 10
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 2].leadingAnchorConstraint.constant = 10
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 2].trailingAnchorConstraint.constant = -10
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 2].bottomAnchorConstraint.constant = -10
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 1].layoutIfNeeded()
                    CardSwipeTriggerAccess.arrCardSwipeTrigger[count - 2].layoutIfNeeded()
                }
            })
    }
    
    
    static private func cardSwipe(addSubView:UIView? = nil, details:Any? = nil, delegate:CardSwipeTriggerDelegate?, superview:UIView, swipeLevel:SwipeLevel = .medium) -> CardSwipeTriggerView{
        let cardSwipeView = CardSwipeTriggerView(addSubView: addSubView, details: details, swipeLevel: swipeLevel)
        cardSwipeView.delegate = delegate
        superview.addSubview(cardSwipeView)
        CardSwipeTriggerAccess.arrCardSwipeTrigger.append(cardSwipeView)
        return cardSwipeView
    }
    
    
    static private func firstTimeUserInteractionToInform() {
        CardSwipeTriggerAccess.animationToFirstInteraction(cardView: CardSwipeTriggerAccess.arrCardSwipeTrigger.last)
    }
    
    
    static private func animationToFirstInteraction(cardView:CardSwipeTriggerView?) {
        
        guard let cardView = cardView else { return }
        
        let angle:CGFloat = 0.09
        let tx:CGFloat = 100.0
        let ty:CGFloat = 10.0
        UIView.animate(withDuration: 0.5, animations: {
            cardView.transform = CGAffineTransform(a: cos(-angle), b: sin(-angle), c: -sin(-angle), d: cos(-angle), tx: -tx , ty: ty).scaledBy(x: 1 - abs(-angle), y: 1 - abs(-angle))
            cardView.layoutIfNeeded()
        }) { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                cardView.transform = .identity
                cardView.layoutIfNeeded()
            }) { (_) in
                UIView.animate(withDuration: 0.5, animations: {
                    cardView.transform = CGAffineTransform(a: cos(angle), b: sin(angle), c: -sin(angle), d: cos(angle), tx: tx , ty: ty).scaledBy(x: 1 - abs(angle), y: 1 - abs(angle))
                    cardView.layoutIfNeeded()
                }) { (_) in
                    UIView.animate(withDuration: 0.5, animations: {
                        cardView.transform = .identity
                        cardView.layoutIfNeeded()
                    }) { (_) in
                        
                    }
                }
            }
        }
    }
}



