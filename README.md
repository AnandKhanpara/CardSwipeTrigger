# CardSwipeTrigger
CardSwipeTrigger

|  |  |  |
|---|---|---|
|![alt tag](https://github.com/AnandKhanpara/GitProHubSupporting/blob/master/GitProHubSupporting/CardSwipeTrigger/Left500Pixel.png)| ![alt tag](https://github.com/AnandKhanpara/GitProHubSupporting/blob/master/GitProHubSupporting/CardSwipeTrigger/Center500Pixel.png) | ![alt tag](https://github.com/AnandKhanpara/GitProHubSupporting/blob/master/GitProHubSupporting/CardSwipeTrigger/Right500Pixel.png) |
|  |  |  |


### Installation with CocoaPods

```
pod 'CardSwipeTrigger', '0.0.4'
```

## Usage
 
Firstly, import CardSwipeTrigger

```swift
import CardSwipeTrigger
```

### Initialization

```swift

CardSwipeTrigger.cardSwipeLevel = .medium
CardSwipeTrigger.delegate = self
CardSwipeTrigger.dataSource = self
CardSwipeTrigger.reload()

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
        
        CardSwipeTrigger.cardSwipeLevel = .medium
        CardSwipeTrigger.delegate = self
        CardSwipeTrigger.dataSource = self
        CardSwipeTrigger.reload()
        
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
extension ViewController: CardSwipeTriggerDataSource {
    
   func cardSwipeSuperView() -> UIView {

   }
    
   func numberOfCardSwipeTrigger() -> Int {
        
   }
    
   func cardSwipe(index: Int) -> UIView {
        
   }
    
   func cardSwipeAddDetails(index: Int) -> Any {
        
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
    
}
```

