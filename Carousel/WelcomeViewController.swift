//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by David Bellona on 9/23/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageOne: UIImageView!
    @IBOutlet weak var pageTwo: UIImageView!
    @IBOutlet weak var pageThree: UIImageView!
    @IBOutlet weak var pageFour: UIImageView!
    @IBOutlet weak var spinUI: UIImageView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var spinSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinUI.alpha = 0
        spinButton.alpha = 0
        spinSwitch.alpha = 0
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: pageOne.frame.width + pageTwo.frame.width + pageThree.frame.width + pageFour.frame.width, height: 568)
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        println("page: \(page)")
        if(pageControl.currentPage == 3) {
            println("page: \(page)")
            UIView.animateWithDuration(0.4, animations: {
                self.spinUI.alpha = 1
                self.spinButton.alpha = 1
                self.spinSwitch.alpha = 1
            })
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
