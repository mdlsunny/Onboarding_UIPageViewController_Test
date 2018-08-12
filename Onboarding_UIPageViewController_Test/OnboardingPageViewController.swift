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
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: (UIScreen.main.bounds.maxY - 50), width: UIScreen.main.bounds.width, height: 50))
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
    
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
}
