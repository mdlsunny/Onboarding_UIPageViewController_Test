// 
// Onboarding_UIPageViewController_Test
//
// Created by Chen Chen on 8/12/18
// Copyright © 2018 Timessis LLC. All rights reserved.
//

import UIKit

class LastPageViewController: UIViewController {

    let startButtonTitleString = "Start"

    @IBOutlet weak var startButton: UIButton!
    
    func configureStartButton() {
        startButton.setTitle(startButtonTitleString, for: .normal)
        startButton.titleLabel?.font = startButtonFont
        startButton.frame = CGRect(x: startButtonOriginX, y: startButtonOriginY, width: startButtonWidth, height: startButtonHeight)
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        startButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        startButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        startButton.layer.cornerRadius = startButtonCornerRadius
    }
    
    override func viewDidLoad() {
//        print(#function)
        super.viewDidLoad()
        configureStartButton()
    }
    
    override func viewDidLayoutSubviews() {
        print(#function)
        print("width: \(screenWidth)")
        print("height: \(screenHeight)")
        super.viewDidLayoutSubviews()
        configureStartButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedStringKey.font: font])
    }
}

extension UIViewController {
    var screenHeight: CGFloat { return UIScreen.main.bounds.height }
    var screenWidth: CGFloat { return UIScreen.main.bounds.width }
}

extension LastPageViewController {
    var startButtonFontSize: CGFloat { return screenHeight * 0.05 }
    var startButtonFont: UIFont { return UIFont.systemFont(ofSize: startButtonFontSize) }
    var startButtonWidth: CGFloat { return startButtonTitleString.size(OfFont: startButtonFont).width * 1.3 }
    var startButtonHeight: CGFloat { return startButtonTitleString.size(OfFont: startButtonFont).height * 1.1 }
    var startButtonOriginX: CGFloat { return (screenWidth - startButtonWidth) * 0.5 }
    var startButtonOriginY: CGFloat { return screenHeight * 0.92 - startButtonHeight }
    var startButtonCornerRadius: CGFloat { return startButtonFontSize / 4 }
}

extension UIScreen {
    func widthOfSafeArea() -> CGFloat {
        guard let rootView = UIApplication.shared.keyWindow else { return 0 }
        if #available(iOS 11.0, *) {
            let leftInset = rootView.safeAreaInsets.left
            let rightInset = rootView.safeAreaInsets.right
            return rootView.bounds.width - leftInset - rightInset
        } else {
            return rootView.bounds.width
        }
    }
    
    func heightOfSafeArea() -> CGFloat {
        guard let rootView = UIApplication.shared.keyWindow else { return 0 }
        if #available(iOS 11.0, *) {
            let topInset = rootView.safeAreaInsets.top
            let bottomInset = rootView.safeAreaInsets.bottom
            return rootView.bounds.height - topInset - bottomInset
        } else {
            return rootView.bounds.height
        }
    }
}

















