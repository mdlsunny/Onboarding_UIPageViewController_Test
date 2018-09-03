// 
// Onboarding_UIPageViewController_Test
//
// Created by Chen Chen on 8/12/18
// Copyright © 2018 Timessis LLC. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    static let pageControlHeight: CGFloat = 30

    var pageControl = UIPageControl()
    
    private func layoutPageControl() {
        print(#function)
        pageControl.frame = CGRect(x: 0, y: (screenHeight - bottomSafeArea - OnboardingPageViewController.pageControlHeight) , width: screenWidth, height: OnboardingPageViewController.pageControlHeight)
    }
    
    private func configurePageControl() {
        print(#function)
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.alpha = 0.75
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        if let firstViewController = subViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        configurePageControl()
    }
    
    override func viewDidLayoutSubviews() {
        print(#function)
        //        print("width: \(screenWidth)")
        //        print("height: \(screenHeight)")
        //        print("Top Safe Area: \(bottomSafeArea)")
        //        print("Bottom Safe Area: \(bottomSafeArea)")
        super.viewDidLayoutSubviews()
        layoutPageControl()
    }
    
    lazy private var subViewControllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc1"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc2"),
            ]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print(#function)
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = subViewControllers.index(of: pageContentViewController)!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print(#function)
        let currentPageIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentPageIndex <= 0) {
            return nil
        }
        return subViewControllers[currentPageIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print(#function)
        let currentPageIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentPageIndex >= subViewControllers.count - 1) {
            return nil
        }
        return subViewControllers[currentPageIndex + 1]
    }
    
    // Below only works on iPhone ...
    //    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
    //        return UIInterfaceOrientationMask.portrait
    //    }
    //
    //    override var shouldAutorotate: Bool {
    //        return false
    //    }
}
