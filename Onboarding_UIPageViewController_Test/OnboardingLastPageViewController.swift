// 
// Onboarding_UIPageViewController_Test
//
// Created by Chen Chen on 8/12/18
// Copyright © 2018 Timessis LLC. All rights reserved.
//

import UIKit

class OnboardingLastPageViewController: UIViewController {
    
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
        //        print(#function)
        //        print("width: \(screenWidth)")
        //        print("height: \(screenHeight)")
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
    var bottomSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.bottom
        } else {
            return bottomLayoutGuide.length
        }
    }
}

extension OnboardingLastPageViewController {
    var startButtonFontSize: CGFloat { return screenHeight * 0.06 }
    var startButtonFont: UIFont { return UIFont.systemFont(ofSize: startButtonFontSize) }
    var startButtonWidth: CGFloat { return startButtonTitleString.size(OfFont: startButtonFont).width * 1.3 }
    var startButtonHeight: CGFloat { return startButtonTitleString.size(OfFont: startButtonFont).height * 1.1 }
    var startButtonOriginX: CGFloat { return (screenWidth - startButtonWidth) * 0.5 }
    var startButtonOriginY: CGFloat { return (screenHeight - bottomSafeArea - OnboardingPageViewController.pageControlHeight - startButtonHeight * 1.1) }
    var startButtonCornerRadius: CGFloat { return startButtonFontSize / 4 }
}


















