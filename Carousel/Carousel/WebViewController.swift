//
//  WebViewController.swift
//  Carousel
//
//  Created by David Bellona on 9/23/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var Webview: UIWebView!
    
    var URLPath = "https//www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadAddressURL()
        println("loadURL")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddressURL(){
        let requestURL = NSURL(string:URLPath)
        let request = NSURLRequest(URL:requestURL)
        Webview.loadRequest(request)
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
