//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by Евгений Борисов on 14.09.2023.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var presentScreenContent = [
        "Первая страница презентации о том о сем и об этом и о том тоже будет немного",
        "Вторая страница презентации о том о сем и об этом и о том тоже будет немного",
        "Третья страница презентации о том о сем и об этом и о том тоже будет немного",
        "Четвертая страница презентации о том о сем и об этом и о том тоже будет немного",
        ""
    ]
    
    var emodjiList = ["😵", "🤑", "🤢", "😿", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "presentationWasViewed")
            dismiss(animated: true)
            return nil
            
        }
        guard let contentViewController = storyboard?.instantiateViewController(identifier: "ContentViewController") as? ContentViewController
        else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emodji = emodjiList[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        return contentViewController
    }
    
    
    
    
    
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController?
    {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    
    
}
















