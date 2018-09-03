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
    
    @IBAction func touchStartButton(_ sender: UIButton) {
        print(#function)
    }
    
    func layoutStartButton() {
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: screenHeight * 0.06)
        startButton.layer.cornerRadius = screenHeight * 0.015
        startButton.frame = CGRect(x: (screenWidth - startButtonTitleString.size(OfFont: (startButton.titleLabel?.font)!).width * 1.3) * 0.5,
                                   y: screenHeight - bottomSafeArea - OnboardingPageViewController.pageControlHeight - startButtonTitleString.size(OfFont: (startButton.titleLabel?.font)!).height * 1.21,
                                   width: startButtonTitleString.size(OfFont: (startButton.titleLabel?.font)!).width * 1.3,
                                   height: startButtonTitleString.size(OfFont: (startButton.titleLabel?.font)!).height * 1.1)
    }
    
    
    func configureStartButton() {
        startButton.setTitle(startButtonTitleString, for: .normal)
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        startButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        startButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
        //        print("Top Safe Area: \(bottomSafeArea)")
        //        print("Bottom Safe Area: \(bottomSafeArea)")
        super.viewDidLayoutSubviews()
        layoutStartButton()
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
    var topSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.top
        } else {
            return topLayoutGuide.length
        }
    }
    var bottomSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.bottom
        } else {
            return bottomLayoutGuide.length
        }
    }
}


















