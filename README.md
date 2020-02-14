# CardSwipeTrigger
CardSwipeTrigger

|  |  |  |
|---|---|---|
|![alt tag](https://github.com/AnandKhanpara/GitProHubSupporting/blob/master/GitProHubSupporting/CardSwipeTrigger/Left500Pixel.png)| ![alt tag](https://github.com/AnandKhanpara/GitProHubSupporting/blob/master/GitProHubSupporting/CardSwipeTrigger/Center500Pixel.png) | ![alt tag](https://github.com/AnandKhanpara/GitProHubSupporting/blob/master/GitProHubSupporting/CardSwipeTrigger/Right500Pixel.png) |
|  |  |  |


### Installation with CocoaPods

```
pod 'CardSwipeTrigger', '0.0.3'
```

## Usage
 
Firstly, import CardSwipeTrigger

```swift
import CardSwipeTrigger
```

### Initialization

```swift
CardSwipeTrigger.addCards(arrView: arrCardView, superview: self.viewSuperView, delegate: nil, swipeLevel: .low)

CardSwipeTrigger.cardSwipeShake()
CardSwipeTrigger.cardLeftSwipe()
CardSwipeTrigger.cardRightSwipe()
```
```swift
import UIKit
import CardSwipeTrigger

class ViewController: UIViewController {

    @IBOutlet weak var viewSuperView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            
            var arrCardView = [[UIView:Any]]()
            
            for i in 0...22 {
                if let cardView = Bundle.main.loadNibNamed("CardView", owner: nil, options: nil)?.first as? CardView {
                    let image = UIImage(named: "\(i)")
                    let image1 = UIImage(named: "profile")
                    cardView.imgViewMain.image = image
                    cardView.imgViewProfile.image = image1
                    cardView.lblTitle.text = "Anand Khanpara"
                    cardView.lblDetails.text = "GitHub & LinkedIn \nCardSwipeTrigger"
                    cardView.btnInfo.addTarget(self, action: #selector(self.btnShake), for: .touchUpInside)
                    arrCardView.append([cardView : i])
                }
            }
            
            CardSwipeTrigger.addCards(arrView: arrCardView, superview: self.viewSuperView, delegate: self, swipeLevel: .low)
        }
    }
    
    @objc func btnShake(_ sender: UIButton) {
        CardSwipeTrigger.cardSwipeShake()
    }
    
    @IBAction func btnDislike(_ sender: UIButton) {
        CardSwipeTrigger.cardLeftSwipe()
    }
    
    @IBAction func btnLike(_ sender: UIButton) {
        CardSwipeTrigger.cardRightSwipe()
    }
}
```

```swift
extension ViewController: CardSwipeTriggerDelegate {
    
    func cardSwipeContinue(cardView: CardSwipeTriggerView, leftSwipe: Bool, rightSwipe: Bool, transfor: CGFloat, details: Any?) {
        
    }
    
    func cardSwipeDidEndLeftSwipe(cardView: CardSwipeTriggerView, details: Any?) {
        
    }
    
    func cardSwipeDidEndRightSwipe(cardView: CardSwipeTriggerView, details: Any?) {
        
    }
    
    func cardSwipeLoadingAddSuperview(cardAddPercentage: CGFloat) {
        
    }
    
}
```

