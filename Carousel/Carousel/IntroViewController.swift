//
//  IntroViewController.swift
//  Carousel
//
//  Created by David Bellona on 9/20/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var introTile1image: UIImageView!
    @IBOutlet weak var introTile2image: UIImageView!
    @IBOutlet weak var introTile3image: UIImageView!
    @IBOutlet weak var introTile4image: UIImageView!
    @IBOutlet weak var introTile5image: UIImageView!
    @IBOutlet weak var introTile6image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = introImage.frame.size
        scrollView.delegate = self
        
        scrollView.sendSubviewToBack(introImage)
        
    
        // set scale and rotate images
        // move image1 (couple)
        introTile1image.transform = CGAffineTransformMakeRotation(CGFloat(345 * M_PI / 180))
        // move image2 (deer)
        introTile2image.transform = CGAffineTransformMakeScale(2, 2)
        introTile2image.transform = CGAffineTransformRotate(introTile2image.transform, CGFloat(345 * M_PI / 180))
        // move image3 (fish)
        introTile3image.transform = CGAffineTransformMakeScale(2, 2)
        introTile3image.transform = CGAffineTransformRotate(introTile3image.transform, CGFloat(15 * M_PI / 180))
        // move image4 (mountain)
        introTile4image.transform = CGAffineTransformMakeScale(2, 2)
        introTile4image.transform = CGAffineTransformRotate(introTile4image.transform, CGFloat(15 * M_PI / 180))
        // move image5 (cabin)
        introTile5image.transform = CGAffineTransformMakeScale(2, 2)
        introTile5image.transform = CGAffineTransformRotate(introTile5image.transform, CGFloat(15 * M_PI / 180))
        // move image6 (dog)
        introTile6image.transform = CGAffineTransformMakeScale(2, 2)
        introTile6image.transform = CGAffineTransformRotate(introTile6image.transform, CGFloat(345 * M_PI / 180))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        var scrollOffset = scrollView.contentOffset.y / scrollView.frame.size.height
        var scrollOffsetPercentage  = (scrollOffset as NSNumber).doubleValue
        var initialDegrees:Double = 15
        var scrollOffsetDegrees = initialDegrees * scrollOffsetPercentage
        
        // move image1 (couple)
        introTile1image.transform = CGAffineTransformMakeRotation(CGFloat((345 + scrollOffsetDegrees) * M_PI / 180))
        introTile1image.transform = CGAffineTransformTranslate(introTile1image.transform, 82 * scrollOffset, 277 * scrollOffset)
        
        // move image2 (deer)
        introTile2image.transform = CGAffineTransformMakeScale(2 - scrollOffset, 2 - scrollOffset)
        introTile2image.transform = CGAffineTransformRotate(introTile2image.transform, CGFloat((345 + scrollOffsetDegrees) * M_PI / 180))
        introTile2image.transform = CGAffineTransformTranslate(introTile2image.transform, -17 * scrollOffset, 256 * scrollOffset)
        
        // move image3 (fish)
        introTile3image.transform = CGAffineTransformMakeScale(2 - scrollOffset, 2 - scrollOffset)
        introTile3image.transform = CGAffineTransformRotate(introTile3image.transform, CGFloat((345 + scrollOffsetDegrees) * M_PI / 180))
        introTile3image.transform = CGAffineTransformTranslate(introTile3image.transform, -3 * scrollOffset, 440 * scrollOffset)
        
        // move image4 (mountain)
        introTile4image.transform = CGAffineTransformMakeScale(2 - scrollOffset, 2 - scrollOffset)
        introTile4image.transform = CGAffineTransformRotate(introTile4image.transform, CGFloat((345 + scrollOffsetDegrees) * M_PI / 180))
        introTile4image.transform = CGAffineTransformTranslate(introTile4image.transform, 77 * scrollOffset, 387 * scrollOffset)
        
        // move image5 (cabin)
        introTile5image.transform = CGAffineTransformMakeScale(2 - scrollOffset, 2 - scrollOffset)
        introTile5image.transform = CGAffineTransformRotate(introTile5image.transform, CGFloat((345 + scrollOffsetDegrees) * M_PI / 180))
        introTile5image.transform = CGAffineTransformTranslate(introTile5image.transform, 129 * scrollOffset, 534 * scrollOffset)
        
        // move image6 (dog)
        introTile6image.transform = CGAffineTransformMakeScale(2 - scrollOffset, 2 - scrollOffset)
        introTile6image.transform = CGAffineTransformRotate(introTile6image.transform, CGFloat((345 + scrollOffsetDegrees) * M_PI / 180))
        introTile6image.transform = CGAffineTransformTranslate(introTile6image.transform, -46 * scrollOffset, 504 * scrollOffset)
        
        
        // This method is called as the user scrolls
        println("50 * scrollOffset: \(50 * scrollOffset)")
        println("introTile2image: \(introTile2image.frame.origin.y)")

    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
