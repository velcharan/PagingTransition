//
//  RootPagingViewController.swift
//  PagingTransition
//
//  Created by velcharan sridhar on 14/02/22.
//

import UIKit

class RootPagingViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var viewControllersList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "ViewController")
        let vc2 = sb.instantiateViewController(withIdentifier: "SecondVC")
        let vc3 = sb.instantiateViewController(withIdentifier: "ThirdVC")
        
        return [vc1, vc2, vc3]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self
        
        if let firstViewController = viewControllersList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllersList.index(of: viewController) else {return nil}
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard viewControllersList.count > previousIndex else {return nil}
        return viewControllersList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllersList.index(of: viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard viewControllersList.count != nextIndex else {return nil}
        guard viewControllersList.count > nextIndex else {return nil}
        return viewControllersList[nextIndex]
    }
}
