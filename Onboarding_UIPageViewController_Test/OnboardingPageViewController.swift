// 
// Onboarding_UIPageViewController_Test
//
// Created by Chen Chen on 8/12/18
// Copyright © 2018 Timessis LLC. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    var pageControl = UIPageControl()
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    var screenMaxX = UIScreen.main.bounds.maxX
    var screenMaxY = UIScreen.main.bounds.maxY
    let pageControlHeightToBoundsHeight: CGFloat = 0.07

    func configurePageControl() {
//        pageControl.frame = CGRect(x: 0, y: screenHeight * (1 - pageControlHeightToBoundsHeight), width: screenWidth, height: screenHeight * pageControlHeightToBoundsHeight)
        pageControl.frame = CGRect(x: 0, y: (screenHeight - 50), width: screenWidth, height: 50)
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.alpha = 0.75
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        self.delegate = self
        self.dataSource = self
        if let firstViewController = subViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        configurePageControl()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = subViewControllers.index(of: pageContentViewController)!
    }
    
    override func viewDidLayoutSubviews() {
        print(#function)
        super.viewDidLayoutSubviews()
        updateViewConstraints()
        //// either put configurePageControl() or just pageControl.frame = CGRect(x: 0, y: (screenHeight - 50), width: screenWidth, height: 50)
        //// below or in viewWillTransition()
        // configurePageControl()
        pageControl.frame = CGRect(x: 0, y: (screenHeight - 50), width: screenWidth, height: 50)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(#function)
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        print("width: \(screenWidth)")
        print("height: \(screenHeight)")
//        screenMaxX = UIScreen.main.bounds.maxX
//        screenMaxY = UIScreen.main.bounds.maxY
//        print("max X: \(screenMaxX)")
//        print("max Y: \(screenMaxY)")
        super.viewWillTransition(to: size, with: coordinator)

        //// either put configurePageControl() or just pageControl.frame = CGRect(x: 0, y: (screenHeight - 50), width: screenWidth, height: 50)
        //// below or in viewDidLayoutSubviews()
//        coordinator.animate(alongsideTransition: { _ in self.configurePageControl() }, completion: nil )
//        coordinator.animate(alongsideTransition: { _ in self.pageControl.frame = CGRect(x: 0, y: (self.screenHeight - 50), width: self.screenWidth, height: 50) }, completion: nil )
    }

    lazy var subViewControllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc1"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc2"),
            ]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentPageIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentPageIndex <= 0) {
            return nil
        }
        return subViewControllers[currentPageIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentPageIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentPageIndex >= subViewControllers.count - 1) {
            return nil
        }
        return subViewControllers[currentPageIndex + 1]
    }
    
    
    // None of below seem to work on iPad...
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}
