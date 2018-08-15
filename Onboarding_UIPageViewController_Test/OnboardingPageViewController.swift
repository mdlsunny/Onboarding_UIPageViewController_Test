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
    
    func configurePageControl() {
        let pageControlHeightToBoundsHeight: CGFloat = 0.07
        pageControl = UIPageControl(frame: CGRect(x: 0, y: screenHeight * (1 - pageControlHeightToBoundsHeight), width: screenWidth, height: screenHeight * pageControlHeightToBoundsHeight ))
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
    
//    override func viewWillAppear(_ animated: Bool) {
//        print(#function)
//    }
//
//    override func viewWillLayoutSubviews() {
//        print(#function)
//    }
//
//    override func viewDidLayoutSubviews() {
//        print(#function)
//        super.viewDidLayoutSubviews()
//    }
//
//    override func updateViewConstraints() {
//        print(#function)
//        super.updateViewConstraints()
//    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(#function)
        screenHeight = UIScreen.main.bounds.height
        screenWidth = UIScreen.main.bounds.width
        //        print("height: \(screenHeight)")
        //        print("width: \(screenWidth)")
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in self.configurePageControl() }, completion: nil )
//        coordinator.animate(alongsideTransition: nil, completion: { _ in self.configurePageControl()} )
//        coordinator.animate(alongsideTransition: <#T##((UIViewControllerTransitionCoordinatorContext) -> Void)?##((UIViewControllerTransitionCoordinatorContext) -> Void)?##(UIViewControllerTransitionCoordinatorContext) -> Void#>, completion: <#T##((UIViewControllerTransitionCoordinatorContext) -> Void)?##((UIViewControllerTransitionCoordinatorContext) -> Void)?##(UIViewControllerTransitionCoordinatorContext) -> Void#>
//        coordinator.animateAlongsideTransition(in: <#T##UIView?#>, animation: <#T##((UIViewControllerTransitionCoordinatorContext) -> Void)?##((UIViewControllerTransitionCoordinatorContext) -> Void)?##(UIViewControllerTransitionCoordinatorContext) -> Void#>, completion: <#T##((UIViewControllerTransitionCoordinatorContext) -> Void)?##((UIViewControllerTransitionCoordinatorContext) -> Void)?##(UIViewControllerTransitionCoordinatorContext) -> Void#>)
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
//    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
//        return UIInterfaceOrientationMask.portrait
//    }
    
//    override var shouldAutorotate: Bool {
//        return false
//    }
}
