//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Stephan Charbit on 10/23/16.
//  Copyright © 2016 Stephan Charbit. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1500, height: 667)
        scrollView.delegate = self
        signInButton.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 375))
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if (page == 3){
            UIView.animate(withDuration: 0.3) { () -> Void in
                self.pageControl.isHidden = true
                self.signInButton.alpha = 1
            }
        }   else {
            self.pageControl.isHidden = false
            self.signInButton.alpha = 0
        }
    }
}
